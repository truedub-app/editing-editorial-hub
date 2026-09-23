import 'package:drift/drift.dart';

import '../data/database/app_database.dart';
import '../data/parsers/rota_excel_parser.dart';
import '../data/repositories/contacts_repository.dart';
import '../data/repositories/rota_repository.dart';
import '../data/repositories/staff_repository.dart';
import '../data/repositories/system_repository.dart';

/// Preview of one parsed sheet, with staff names resolved (or flagged as
/// unknown) against the existing Staff table — nothing is written to the
/// database until [ExcelImportService.confirmImport] is called.
class ImportPreview {
  ImportPreview({
    required this.fileName,
    required this.parsed,
    required this.resolvedStaffIds,
    required this.unknownNames,
  });

  final String fileName;
  final ParsedRotaImport parsed;
  /// Normalized staff name -> existing Staff.id (absent if unknown).
  final Map<String, int> resolvedStaffIds;
  final Set<String> unknownNames;

  int get staffFoundCount => resolvedStaffIds.length;
  int get staffNewCount => unknownNames.length;
  int get dayCount => parsed.dayCount;
  int get cellsProcessed => parsed.cellsProcessed;
  int get inChargeCellCount => parsed.inChargeCellCount;
  int get qc2CellCount => parsed.qc2CellCount;
  List<String> get warnings => parsed.warnings;
}

class ExcelImportService {
  ExcelImportService({
    required StaffRepository staffRepository,
    required RotaRepository rotaRepository,
    required SystemRepository systemRepository,
    required ContactsRepository contactsRepository,
  })  : _staffRepository = staffRepository,
        _rotaRepository = rotaRepository,
        _systemRepository = systemRepository,
        _contactsRepository = contactsRepository,
        _parser = RotaExcelParser();

  final StaffRepository _staffRepository;
  final RotaRepository _rotaRepository;
  final SystemRepository _systemRepository;
  final ContactsRepository _contactsRepository;
  final RotaExcelParser _parser;

  String _normalize(String s) =>
      s.replaceAll(' ', ' ').replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();

  Future<List<ImportPreview>> buildPreviews(List<int> bytes, String fileName) async {
    final sheets = _parser.parseWorkbookBytes(bytes);
    final existingStaff = await _staffRepository.getAll();
    final byNormalizedName = {
      for (final s in existingStaff) _normalize(s.fullName): s.id,
    };

    return sheets.map((parsed) {
      final resolved = <String, int>{};
      final unknown = <String>{};
      for (final section in parsed.sections) {
        for (final row in section.rows) {
          final key = _normalize(row.staffName);
          final id = byNormalizedName[key];
          if (id != null) {
            resolved[key] = id;
          } else {
            unknown.add(row.staffName);
          }
        }
      }
      return ImportPreview(
        fileName: fileName,
        parsed: parsed,
        resolvedStaffIds: resolved,
        unknownNames: unknown,
      );
    }).toList();
  }

  /// Commits a previewed sheet. Unknown staff names are created as new,
  /// active Staff records (home section taken from the first block they
  /// appear in) — never silently dropped.
  Future<int> confirmImport(ImportPreview preview, {String? importedBy}) async {
    final byNormalizedName = Map<String, int>.from(preview.resolvedStaffIds);

    for (final name in preview.unknownNames) {
      final key = _normalize(name);
      if (byNormalizedName.containsKey(key)) continue;
      final section = preview.parsed.sections
          .firstWhere((s) => s.rows.any((r) => _normalize(r.staffName) == key))
          .sectionName;
      final newId = await _staffRepository.insertStaff(StaffCompanion.insert(
        fullName: name,
        initials: _staffRepository.initialsFor(name),
        homeSection: Value(section),
      ));
      byNormalizedName[key] = newId;
    }

    // Every staff member gets a linked department contact, even if the
    // source rota has no extension/email for them (data-integrity tools
    // flag those gaps rather than the app inventing contact details).
    for (final staffId in byNormalizedName.values) {
      final existingContact = await _contactsRepository.byLinkedStaff(staffId);
      if (existingContact != null) continue;
      final staff = await _staffRepository.byId(staffId);
      if (staff != null) {
        await _contactsRepository.createFromStaff(staff, team: 'Editing & Editorial');
      }
    }

    final importId = await _systemRepository.createImportRecord(
      fileName: preview.fileName,
      importedBy: importedBy,
      recordsProcessed: preview.cellsProcessed,
      warnings: preview.warnings,
    );

    final rows = <RotaAssignmentCompanion>[];
    // Keyed by "date|section" so an in-charge cell and a QC2 cell for the
    // same band (different people, different cells) merge into one duty
    // record instead of clobbering each other.
    final dutyUpdates = <String, ({DateTime date, String section, int? inCharge, int? qc2})>{};

    void mergeDuty(DateTime date, String section, {int? inCharge, int? qc2}) {
      final key = '${date.toIso8601String()}|$section';
      final existing = dutyUpdates[key];
      dutyUpdates[key] = (
        date: date,
        section: section,
        inCharge: inCharge ?? existing?.inCharge,
        qc2: qc2 ?? existing?.qc2,
      );
    }

    for (final section in preview.parsed.sections) {
      for (final row in section.rows) {
        final staffId = byNormalizedName[_normalize(row.staffName)]!;
        for (var i = 0; i < section.dates.length; i++) {
          final cell = row.cells[i];
          if (cell == null) continue;
          final date = section.dates[i];
          rows.add(RotaAssignmentCompanion.insert(
            staffId: staffId,
            date: date,
            section: section.sectionName,
            code: cell.code,
            hoursStart: Value(cell.hoursStart),
            hoursEnd: Value(cell.hoursEnd),
            qc2Duty: Value(cell.qc2Duty),
            status: cell.status,
            sourceImportId: Value(importId),
          ));
          if (cell.qc2Duty) {
            mergeDuty(date, section.sectionName, qc2: staffId);
          }
          if (cell.inCharge) {
            mergeDuty(date, section.sectionName, inCharge: staffId);
          }
        }
      }
    }

    await _rotaRepository.bulkUpsert(rows);

    for (final update in dutyUpdates.values) {
      final existing = await _rotaRepository.dutyFor(update.date, update.section);
      await _rotaRepository.upsertDuty(
        date: update.date,
        section: update.section,
        inChargeStaffId: update.inCharge ?? existing?.inChargeStaffId,
        qc2StaffId: update.qc2 ?? existing?.qc2StaffId,
      );
    }

    return importId;
  }
}
