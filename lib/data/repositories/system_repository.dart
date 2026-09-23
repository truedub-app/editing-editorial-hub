import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';

class SystemRepository {
  SystemRepository(this._db);
  final AppDatabase _db;

  // ---- Key/value settings ----

  Future<String?> getSetting(String key) async {
    final row = await (_db.select(_db.appSetting)..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> setSetting(String key, String? value) async {
    await _db.into(_db.appSetting).insertOnConflictUpdate(
          AppSettingCompanion.insert(key: key, value: Value(value)),
        );
  }

  Stream<String?> watchSetting(String key) {
    return (_db.select(_db.appSetting)..where((t) => t.key.equals(key)))
        .watchSingleOrNull()
        .map((row) => row?.value);
  }

  // ---- Import records ----

  Future<int> createImportRecord({
    required String fileName,
    String? importedBy,
    required int recordsProcessed,
    required List<String> warnings,
  }) async {
    final nextVersion = (await getSetting('data_version_counter')) ?? '0';
    final version = (int.tryParse(nextVersion) ?? 0) + 1;
    await setSetting('data_version_counter', version.toString());
    await setSetting('last_import_at', DateTime.now().toIso8601String());

    return _db.into(_db.importRecord).insert(ImportRecordCompanion.insert(
          fileName: fileName,
          importedBy: Value(importedBy),
          importedAt: DateTime.now(),
          recordsProcessed: Value(recordsProcessed),
          warningsJson: Value(jsonEncode(warnings)),
          version: version,
        ));
  }

  Stream<List<ImportRecordData>> watchImportHistory() {
    return (_db.select(_db.importRecord)
          ..orderBy([(t) => OrderingTerm.desc(t.importedAt)]))
        .watch();
  }

  Future<void> markRollbackUnavailable(int importId) async {
    await (_db.update(_db.importRecord)..where((t) => t.id.equals(importId)))
        .write(const ImportRecordCompanion(rollbackAvailable: Value(false)));
  }

  // ---- Audit log ----

  Future<void> logAudit({
    String? actor,
    required String action,
    required String entity,
    int? entityId,
    String? details,
  }) async {
    await _db.into(_db.auditLogEntry).insert(AuditLogEntryCompanion.insert(
          actor: Value(actor),
          action: action,
          entity: entity,
          entityId: Value(entityId),
          timestamp: DateTime.now(),
          details: Value(details),
        ));
  }

  Stream<List<AuditLogEntryData>> watchAuditLog({int limit = 200}) {
    return (_db.select(_db.auditLogEntry)
          ..orderBy([(t) => OrderingTerm.desc(t.timestamp)])
          ..limit(limit))
        .watch();
  }

  // ---- Status counts ----

  Future<int> countStaff() async =>
      (await _db.select(_db.staff).get()).length;

  Future<int> countContacts() async =>
      (await _db.select(_db.contact).get()).length;

  Future<int> countManualDocuments() async =>
      (await _db.select(_db.manualDocument).get()).length;
}
