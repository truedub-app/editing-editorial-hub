import 'package:drift/drift.dart';
import 'staff_table.dart';
import 'system_tables.dart';

/// One cell of the imported rota: a single staff member's status on a single
/// date within a section band. `qc2Duty` is derived from the source cell
/// text "missing list & QC 2" — the real file has no separate in-charge flag.
class RotaAssignment extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get staffId => integer().references(Staff, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get section => text()();
  TextColumn get code => text()();
  TextColumn get hoursStart => text().nullable()();
  TextColumn get hoursEnd => text().nullable()();
  BoolColumn get qc2Duty => boolean().withDefault(const Constant(false))();
  TextColumn get status => text()();
  IntColumn get sourceImportId => integer().nullable().references(ImportRecord, #id)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {staffId, date},
      ];
}

/// Exactly one in-charge + one QC2 holder per band per day. In-charge is
/// always admin-set in-app (the source Excel never carries it); QC2 is
/// pre-filled from the import and remains editable.
class DutyAssignment extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  TextColumn get section => text()();
  @ReferenceName('inChargeDutyAssignments')
  IntColumn get inChargeStaffId => integer().nullable().references(Staff, #id)();
  @ReferenceName('qc2DutyAssignments')
  IntColumn get qc2StaffId => integer().nullable().references(Staff, #id)();

  @override
  List<Set<Column>> get uniqueKeys => [
        {date, section},
      ];
}

/// Admin-editable shift code dictionary (spec: "custom codes may be added").
class ShiftCode extends Table {
  TextColumn get code => text()();
  TextColumn get label => text()();
  TextColumn get hoursStart => text().nullable()();
  TextColumn get hoursEnd => text().nullable()();
  TextColumn get colorHex => text().nullable()();
  BoolColumn get isCustom => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {code};
}
