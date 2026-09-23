import 'package:drift/drift.dart';

/// One row per Excel import. RotaAssignment rows are tagged with the
/// import's id so an import can be rolled back later.
class ImportRecord extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fileName => text()();
  TextColumn get importedBy => text().nullable()();
  DateTimeColumn get importedAt => dateTime()();
  IntColumn get recordsProcessed => integer().withDefault(const Constant(0))();
  TextColumn get warningsJson => text().nullable()();
  IntColumn get version => integer()();
  BoolColumn get rollbackAvailable => boolean().withDefault(const Constant(true))();
}

/// Audit trail for sensitive views/edits (spec: blacklist view/edit audit).
class AuditLogEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get actor => text().nullable()();
  TextColumn get action => text()();
  TextColumn get entity => text()();
  IntColumn get entityId => integer().nullable()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get details => text().nullable()();
}

/// Generic local key/value store: PIN hash+salt, current user profile,
/// last import/backup timestamps, onboarding flags, data version.
class AppSetting extends Table {
  TextColumn get key => text()();
  TextColumn get value => text().nullable()();

  @override
  Set<Column> get primaryKey => {key};
}
