import 'package:drift/drift.dart';

/// Home sections a staff member can belong to. Stored as plain text so an
/// admin can introduce new sections later without a schema migration.
class Staff extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fullName => text()();
  TextColumn get initials => text().withLength(min: 1, max: 4)();
  TextColumn get jobTitle => text().nullable()();
  TextColumn get homeSection => text().withDefault(const Constant('Unassigned'))();
  TextColumn get defaultShiftCode => text().nullable()();
  TextColumn get suiteOrBay => text().nullable()();
  TextColumn get extension => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get skills => text().nullable()();
  TextColumn get languages => text().nullable()();
  BoolColumn get inChargeEligible => boolean().withDefault(const Constant(true))();
  BoolColumn get qc2Eligible => boolean().withDefault(const Constant(true))();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}
