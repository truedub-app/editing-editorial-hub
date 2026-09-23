import 'package:drift/drift.dart';

import '../database/app_database.dart';

class RotaWithStaff {
  RotaWithStaff(this.assignment, this.staff);
  final RotaAssignmentData assignment;
  final StaffData staff;
}

class RotaRepository {
  RotaRepository(this._db);
  final AppDatabase _db;

  DateTime _dayStart(DateTime d) => DateTime(d.year, d.month, d.day);

  Future<void> bulkUpsert(List<RotaAssignmentCompanion> rows) async {
    await _db.batch((batch) {
      batch.insertAllOnConflictUpdate(_db.rotaAssignment, rows);
    });
  }

  Stream<List<RotaWithStaff>> watchForDate(DateTime date, {String? section}) {
    final day = _dayStart(date);
    final query = _db.select(_db.rotaAssignment).join([
      innerJoin(_db.staff, _db.staff.id.equalsExp(_db.rotaAssignment.staffId)),
    ])
      ..where(_db.rotaAssignment.date.equals(day));
    if (section != null) {
      query.where(_db.rotaAssignment.section.equals(section));
    }
    return query.watch().map((rows) => rows
        .map((r) => RotaWithStaff(
              r.readTable(_db.rotaAssignment),
              r.readTable(_db.staff),
            ))
        .toList());
  }

  Stream<List<RotaWithStaff>> watchForRange(DateTime start, DateTime endInclusive, {int? staffId}) {
    final s = _dayStart(start);
    final e = _dayStart(endInclusive);
    final query = _db.select(_db.rotaAssignment).join([
      innerJoin(_db.staff, _db.staff.id.equalsExp(_db.rotaAssignment.staffId)),
    ])
      ..where(_db.rotaAssignment.date.isBiggerOrEqualValue(s) &
          _db.rotaAssignment.date.isSmallerOrEqualValue(e));
    if (staffId != null) {
      query.where(_db.rotaAssignment.staffId.equals(staffId));
    }
    return query.watch().map((rows) => rows
        .map((r) => RotaWithStaff(
              r.readTable(_db.rotaAssignment),
              r.readTable(_db.staff),
            ))
        .toList());
  }

  /// Staff who are actually rostered to work this band on this date
  /// (excludes OFF/HOL/TOIL/SICK) — used to populate/validate the duty
  /// board's dropdowns.
  Future<List<StaffData>> workingStaffFor(DateTime date, String section) async {
    final day = _dayStart(date);
    final query = _db.select(_db.rotaAssignment).join([
      innerJoin(_db.staff, _db.staff.id.equalsExp(_db.rotaAssignment.staffId)),
    ])
      ..where(_db.rotaAssignment.date.equals(day) &
          _db.rotaAssignment.section.equals(section) &
          _db.rotaAssignment.status.equals('Working'));
    final rows = await query.get();
    return rows.map((r) => r.readTable(_db.staff)).toList();
  }

  Stream<List<DutyAssignmentData>> watchDutyForDate(DateTime date) {
    final day = _dayStart(date);
    return (_db.select(_db.dutyAssignment)..where((t) => t.date.equals(day))).watch();
  }

  Future<DutyAssignmentData?> dutyFor(DateTime date, String section) {
    final day = _dayStart(date);
    return (_db.select(_db.dutyAssignment)
          ..where((t) => t.date.equals(day) & t.section.equals(section)))
        .getSingleOrNull();
  }

  Future<void> upsertDuty({
    required DateTime date,
    required String section,
    int? inChargeStaffId,
    int? qc2StaffId,
  }) async {
    final day = _dayStart(date);
    final existing = await dutyFor(day, section);
    if (existing == null) {
      await _db.into(_db.dutyAssignment).insert(DutyAssignmentCompanion.insert(
            date: day,
            section: section,
            inChargeStaffId: Value(inChargeStaffId),
            qc2StaffId: Value(qc2StaffId),
          ));
    } else {
      await (_db.update(_db.dutyAssignment)..where((t) => t.id.equals(existing.id))).write(
        DutyAssignmentCompanion(
          inChargeStaffId: Value(inChargeStaffId),
          qc2StaffId: Value(qc2StaffId),
        ),
      );
    }
  }

  Future<void> rollbackImport(int importId) async {
    await (_db.delete(_db.rotaAssignment)..where((t) => t.sourceImportId.equals(importId))).go();
  }

  /// Distinct section names currently in use, in the department's
  /// conventional display order.
  Future<List<String>> distinctSections() async {
    const order = ['Morning', 'Afternoon', 'Night', 'Unassigned'];
    final rows = await _db.customSelect(
      'SELECT DISTINCT section FROM rota_assignment',
    ).get();
    final found = rows.map((r) => r.data['section'].toString()).toSet();
    return [
      ...order.where(found.contains),
      ...found.where((s) => !order.contains(s)),
    ];
  }
}
