import 'package:excel/excel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:editing_editorial_hub/data/parsers/rota_excel_parser.dart';

/// Builds a workbook that mirrors the real department ROTA layout closely
/// enough to exercise the parser: a section header row (name + 3 dates),
/// followed by staff rows mixing a normal shift, an OFF day and a QC2 duty
/// cell — without using any real staff names from the actual monthly file.
List<int> _buildSampleWorkbook() {
  final excel = Excel.createExcel();
  final sheet = excel['Sep '];
  excel.setDefaultSheet('Sep ');
  excel.delete('Sheet1');

  sheet.appendRow([
    TextCellValue('Morning shift'),
    TextCellValue('Sun 13 /09/2026'),
    TextCellValue('Mon 14 /09/2026'),
    TextCellValue('Tue 15 /09/2026'),
  ]);
  sheet.appendRow([
    TextCellValue('Test Staffer A'),
    TextCellValue('08 till 16 00'),
    TextCellValue('   OFF'),
    TextCellValue('missing list &\nQC 2 '),
  ]);
  sheet.appendRow([
    TextCellValue('Test Staffer B'),
    TextCellValue('Holiday '),
    TextCellValue('08 till 16 00'),
    TextCellValue('toil '),
  ]);

  sheet.appendRow([TextCellValue('')]);

  sheet.appendRow([
    TextCellValue('Afternoon shift'),
    TextCellValue('Sun 13 /09/2026'),
    TextCellValue('Mon 14 /09/2026'),
  ]);
  sheet.appendRow([
    TextCellValue('Test Staffer C'),
    TextCellValue('16 00 till 00 00  '),
    TextCellValue('gibberish xyz'),
  ]);

  return excel.encode()!;
}

void main() {
  test('parses section blocks, dates, and shift/duty/off/holiday codes', () {
    final bytes = _buildSampleWorkbook();
    final parser = RotaExcelParser();
    final results = parser.parseWorkbookBytes(bytes);

    expect(results, hasLength(1));
    final sheetResult = results.first;
    expect(sheetResult.sheetName, 'Sep ');
    expect(sheetResult.sections, hasLength(2));

    final morning = sheetResult.sections.firstWhere((s) => s.sectionName == 'Morning');
    expect(morning.dates, hasLength(3));
    expect(morning.dates.first, DateTime(2026, 9, 13));
    expect(morning.rows, hasLength(2));

    final staffA = morning.rows.firstWhere((r) => r.staffName == 'Test Staffer A');
    expect(staffA.cells[0]!.code, 'M');
    expect(staffA.cells[0]!.hoursStart, '08:00');
    expect(staffA.cells[0]!.hoursEnd, '16:00');
    expect(staffA.cells[1]!.status, 'OFF');
    expect(staffA.cells[2]!.qc2Duty, isTrue);
    // QC2 duty falls in the Morning section, so hours are inferred as 08-16.
    expect(staffA.cells[2]!.hoursStart, '08:00');

    final staffB = morning.rows.firstWhere((r) => r.staffName == 'Test Staffer B');
    expect(staffB.cells[0]!.status, 'HOL');
    expect(staffB.cells[2]!.status, 'TOIL');

    final afternoon = sheetResult.sections.firstWhere((s) => s.sectionName == 'Afternoon');
    final staffC = afternoon.rows.single;
    expect(staffC.cells[0]!.code, 'A');
    expect(staffC.cells[0]!.hoursStart, '16:00');
    // Unrecognized text must not be silently discarded: null cell + warning.
    expect(staffC.cells[1], isNull);
    expect(sheetResult.warnings.any((w) => w.contains('gibberish xyz')), isTrue);

    expect(sheetResult.staffCount, 3);
    expect(sheetResult.dayCount, 3);
  });
}
