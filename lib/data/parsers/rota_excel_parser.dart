import 'package:excel/excel.dart';

/// A single parsed shift cell for one staff member on one date.
class ParsedRotaCell {
  ParsedRotaCell({
    required this.code,
    required this.status,
    this.hoursStart,
    this.hoursEnd,
    this.qc2Duty = false,
    this.rawText,
  });

  final String code;
  final String status;
  final String? hoursStart;
  final String? hoursEnd;
  final bool qc2Duty;
  final String? rawText;
}

/// One staff member's row within a section block, with one [ParsedRotaCell]
/// per date column (dates and cells share the same index).
class ParsedRotaRow {
  ParsedRotaRow({required this.staffName, required this.cells});

  final String staffName;
  final List<ParsedRotaCell?> cells;
}

/// A contiguous block of the sheet under one section header
/// ("Morning shift", "Afternoon shift", "Night shift", "Staff on holidays").
class ParsedRotaSection {
  ParsedRotaSection({
    required this.sectionName,
    required this.dates,
    required this.rows,
  });

  final String sectionName;
  final List<DateTime> dates;
  final List<ParsedRotaRow> rows;
}

class ParsedRotaImport {
  ParsedRotaImport({
    required this.sheetName,
    required this.sections,
    required this.warnings,
    required this.cellsProcessed,
  });

  final String sheetName;
  final List<ParsedRotaSection> sections;
  final List<String> warnings;
  final int cellsProcessed;

  int get staffCount =>
      sections.expand((s) => s.rows.map((r) => r.staffName.trim().toLowerCase())).toSet().length;

  int get dayCount => sections.expand((s) => s.dates).map((d) => d.toIso8601String().split('T').first).toSet().length;
}

/// Parses the department's real monthly ROTA workbook.
///
/// The real file (not the hypothetical column-mapped layout) is a single
/// sheet per cycle with section blocks stacked vertically: a bold header row
/// naming the section ("Morning shift", "Staff on holidays", …) followed by
/// a date-header row, followed by one row per staff member until a blank
/// row or the next header. Cells are free text such as "08 till 16 00",
/// "\xa0\xa0 OFF", "missing list &\nQC 2 ", "Holiday ", "toil ".
class RotaExcelParser {
  static const _sectionHeaderKeywords = ['shift', 'holiday'];

  static final _dateRegex = RegExp(r'(\d{1,2})\D{0,3}(\d{1,2})\D{0,3}(\d{4})');
  static final _hoursRegex = RegExp(r'(\d{1,2})\D{0,2}(\d{2})?\D+(\d{1,2})\D{0,2}(\d{2})?');

  List<ParsedRotaImport> parseWorkbookBytes(List<int> bytes) {
    final excel = Excel.decodeBytes(bytes);
    final results = <ParsedRotaImport>[];
    for (final sheetName in excel.tables.keys) {
      final sheet = excel.tables[sheetName];
      if (sheet == null) continue;
      results.add(_parseSheet(sheetName, sheet));
    }
    return results;
  }

  ParsedRotaImport _parseSheet(String sheetName, Sheet sheet) {
    final warnings = <String>[];
    final sections = <ParsedRotaSection>[];
    var cellsProcessed = 0;

    final maxRow = sheet.maxRows;
    int r = 0;
    while (r < maxRow) {
      final headerText = _cellText(sheet, 0, r);
      if (headerText != null && _looksLikeSectionHeader(headerText)) {
        final sectionName = _normalizeSectionName(headerText);

        // The date header is on the same row, columns 1..N.
        final dates = <DateTime>[];
        var col = 1;
        while (true) {
          final text = _cellText(sheet, col, r);
          if (text == null || text.trim().isEmpty) break;
          final date = _parseDate(text);
          if (date == null) break;
          dates.add(date);
          col++;
        }

        if (dates.isEmpty) {
          warnings.add('Section "$sectionName" (row ${r + 1}): no date columns detected — skipped.');
          r++;
          continue;
        }

        // Staff rows follow until a blank column-A cell or the next header.
        final rows = <ParsedRotaRow>[];
        var sr = r + 1;
        while (sr < maxRow) {
          final nameText = _cellText(sheet, 0, sr);
          if (nameText == null || nameText.trim().isEmpty) break;
          if (_looksLikeSectionHeader(nameText)) break;

          final staffName = _cleanText(nameText);
          final cells = <ParsedRotaCell?>[];
          for (var c = 0; c < dates.length; c++) {
            final raw = _cellText(sheet, c + 1, sr);
            final parsed = _parseCell(raw, sectionName);
            if (raw != null && raw.trim().isNotEmpty) {
              cellsProcessed++;
              if (parsed == null) {
                warnings.add('Unrecognized shift text "$raw" for "$staffName" on ${_fmt(dates[c])} — kept as Unknown.');
              }
            }
            cells.add(parsed);
          }
          rows.add(ParsedRotaRow(staffName: staffName, cells: cells));
          sr++;
        }

        sections.add(ParsedRotaSection(sectionName: sectionName, dates: dates, rows: rows));
        r = sr;
      } else {
        r++;
      }
    }

    if (sections.isEmpty) {
      warnings.add('No recognizable section blocks found on sheet "$sheetName".');
    }

    return ParsedRotaImport(
      sheetName: sheetName,
      sections: sections,
      warnings: warnings,
      cellsProcessed: cellsProcessed,
    );
  }

  bool _looksLikeSectionHeader(String text) {
    final lower = text.toLowerCase();
    return _sectionHeaderKeywords.any(lower.contains);
  }

  String _normalizeSectionName(String headerText) {
    final lower = _cleanText(headerText).toLowerCase();
    if (lower.contains('morning')) return 'Morning';
    if (lower.contains('afternoon')) return 'Afternoon';
    if (lower.contains('night')) return 'Night';
    if (lower.contains('holiday')) return 'Unassigned';
    return _cleanText(headerText);
  }

  String? _cellText(Sheet sheet, int col, int row) {
    if (row >= sheet.maxRows) return null;
    final rowData = sheet.row(row);
    if (col >= rowData.length) return null;
    final value = rowData[col]?.value;
    if (value == null) return null;
    return value.toString();
  }

  String _cleanText(String text) {
    return text.replaceAll(' ', ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  DateTime? _parseDate(String text) {
    final match = _dateRegex.firstMatch(text);
    if (match == null) return null;
    final day = int.tryParse(match.group(1)!);
    final month = int.tryParse(match.group(2)!);
    final year = int.tryParse(match.group(3)!);
    if (day == null || month == null || year == null) return null;
    if (month < 1 || month > 12 || day < 1 || day > 31) return null;
    return DateTime(year, month, day);
  }

  ParsedRotaCell? _parseCell(String? raw, String sectionName) {
    if (raw == null) return null;
    final clean = _cleanText(raw);
    if (clean.isEmpty) return null;
    final lower = clean.toLowerCase();

    if (lower.contains('missing list') && lower.contains('qc')) {
      final band = _bandHoursForSection(sectionName);
      return ParsedRotaCell(
        code: band?.code ?? 'DUTY',
        status: 'Working',
        hoursStart: band?.start,
        hoursEnd: band?.end,
        qc2Duty: true,
        rawText: clean,
      );
    }
    if (lower.contains('off')) {
      return ParsedRotaCell(code: 'OFF', status: 'OFF', rawText: clean);
    }
    if (lower.contains('holiday') || lower == 'hol') {
      return ParsedRotaCell(code: 'HOL', status: 'HOL', rawText: clean);
    }
    if (lower.contains('toil')) {
      return ParsedRotaCell(code: 'TOIL', status: 'TOIL', rawText: clean);
    }
    if (lower.contains('sick')) {
      return ParsedRotaCell(code: 'SICK', status: 'SICK', rawText: clean);
    }

    final hoursMatch = _hoursRegex.firstMatch(clean);
    if (hoursMatch != null) {
      final startH = int.tryParse(hoursMatch.group(1) ?? '');
      final endH = int.tryParse(hoursMatch.group(3) ?? '');
      if (startH != null && endH != null) {
        final start = '${startH.toString().padLeft(2, '0')}:00';
        final end = '${endH.toString().padLeft(2, '0')}:00';
        final code = _codeForHours(startH);
        return ParsedRotaCell(
          code: code,
          status: 'Working',
          hoursStart: start,
          hoursEnd: end,
          rawText: clean,
        );
      }
    }

    return null;
  }

  _Band? _bandHoursForSection(String sectionName) {
    switch (sectionName) {
      case 'Morning':
        return const _Band('M', '08:00', '16:00');
      case 'Afternoon':
        return const _Band('A', '16:00', '00:00');
      case 'Night':
        return const _Band('N', '00:00', '08:00');
      default:
        return null;
    }
  }

  String _codeForHours(int startHour) {
    if (startHour >= 6 && startHour < 12) return 'M';
    if (startHour >= 12 && startHour < 22) return 'A';
    return 'N';
  }

  String _fmt(DateTime d) => '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
}

class _Band {
  const _Band(this.code, this.start, this.end);
  final String code;
  final String start;
  final String end;
}
