import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';

/// Web preview backend: IndexedDB/OPFS-backed SQLite via WASM, instead of
/// the native SQLite file used on Windows/Android/iOS. This is a genuinely
/// different storage layer (there is no local file to back up/restore on
/// the web — see BackupService's web stub).
QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final result = await WasmDatabase.open(
      databaseName: 'editing_editorial_hub',
      sqlite3Uri: Uri.parse('sqlite3.wasm'),
      driftWorkerUri: Uri.parse('drift_worker.dart.js'),
    );
    return result.resolvedExecutor;
  });
}
