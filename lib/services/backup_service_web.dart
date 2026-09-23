import 'dart:typed_data';

import 'backup_manifest.dart';

/// Web preview stub — there is no local database *file* on the web backend
/// (data lives in IndexedDB/OPFS via the sqlite3 WASM build), so raw-file
/// backup/restore doesn't apply here. BackupScreen checks `kIsWeb` and never
/// calls into this; these throw defensively if something does.
class BackupService {
  Future<Uint8List> buildEncryptedPackage({
    required String passphrase,
    required int dataVersion,
    required Map<String, int> counts,
  }) {
    throw UnsupportedError('Backup export is not available in the web preview.');
  }

  Future<BackupManifest> readManifestFromBytes(Uint8List packageBytes, String passphrase) {
    throw UnsupportedError('Backup restore is not available in the web preview.');
  }

  Future<void> importBackupFromBytes(Uint8List packageBytes, String passphrase) {
    throw UnsupportedError('Backup restore is not available in the web preview.');
  }
}
