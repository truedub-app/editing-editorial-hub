import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:cryptography/cryptography.dart';

import '../data/database/connection/connection_native.dart';
import 'backup_manifest.dart';

/// Produces/reads the encrypted `.hub` backup package (spec section 3,
/// Option A). The package is a zip archive of {manifest.json, app.db}
/// itself encrypted with AES-256-GCM, keyed by a passphrase the admin
/// enters at export time (PBKDF2, random salt per export).
class BackupService {
  static const _magic = 'EEHB1';
  static const _pbkdf2Iterations = 200000;

  /// Builds the encrypted package bytes. The caller (UI layer) is
  /// responsible for actually writing them to disk via file_picker's
  /// bytes-based save API, which is required on sandboxed platforms.
  Future<Uint8List> buildEncryptedPackage({
    required String passphrase,
    required int dataVersion,
    required Map<String, int> counts,
  }) async {
    final dbFile = await resolveDbFile();
    final dbBytes = await dbFile.readAsBytes();

    final manifest = BackupManifest(
      exportedAt: DateTime.now(),
      dataVersion: dataVersion,
      counts: counts,
    );

    final archive = Archive();
    final manifestBytes = utf8.encode(jsonEncode(manifest.toJson()));
    archive.addFile(ArchiveFile('manifest.json', manifestBytes.length, manifestBytes));
    archive.addFile(ArchiveFile('app.db', dbBytes.length, dbBytes));

    final zipBytes = ZipEncoder().encode(archive)!;

    final salt = _randomBytes(16);
    final key = await Pbkdf2.hmacSha256(iterations: _pbkdf2Iterations, bits: 256)
        .deriveKeyFromPassword(password: passphrase, nonce: salt);

    final algorithm = AesGcm.with256bits();
    final nonce = algorithm.newNonce();
    final box = await algorithm.encrypt(zipBytes, secretKey: key, nonce: nonce);

    final out = BytesBuilder()
      ..add(utf8.encode(_magic))
      ..add(salt)
      ..add(box.nonce)
      ..add(box.mac.bytes)
      ..add(box.cipherText);

    return out.toBytes();
  }

  Future<BackupManifest> readManifestFromBytes(Uint8List packageBytes, String passphrase) async {
    final result = await _decryptPackage(packageBytes, passphrase);
    final archive = ZipDecoder().decodeBytes(result);
    final manifestFile = archive.findFile('manifest.json');
    if (manifestFile == null) {
      throw const FormatException('Backup package is missing manifest.json.');
    }
    final json = jsonDecode(utf8.decode(manifestFile.content as List<int>));
    return BackupManifest.fromJson(json as Map<String, dynamic>);
  }

  /// Replaces the current local database file with the one inside the
  /// package. Caller must close the current [AppDatabase] connection first,
  /// and the app should be restarted afterward to reopen a clean connection.
  Future<void> importBackupFromBytes(Uint8List packageBytes, String passphrase) async {
    final result = await _decryptPackage(packageBytes, passphrase);
    final archive = ZipDecoder().decodeBytes(result);
    final dbEntry = archive.findFile('app.db');
    if (dbEntry == null) {
      throw const FormatException('Backup package is missing app.db.');
    }
    final dbFile = await resolveDbFile();
    await dbFile.writeAsBytes(dbEntry.content as List<int>, flush: true);
  }

  Future<Uint8List> _decryptPackage(Uint8List raw, String passphrase) async {
    final magicLen = _magic.length;
    if (raw.length < magicLen || utf8.decode(raw.sublist(0, magicLen)) != _magic) {
      throw const FormatException('Not a valid Editing & Editorial Hub backup file.');
    }
    var offset = magicLen;
    final salt = raw.sublist(offset, offset + 16);
    offset += 16;
    final nonce = raw.sublist(offset, offset + 12);
    offset += 12;
    final mac = raw.sublist(offset, offset + 16);
    offset += 16;
    final cipherText = raw.sublist(offset);

    final key = await Pbkdf2.hmacSha256(iterations: _pbkdf2Iterations, bits: 256)
        .deriveKeyFromPassword(password: passphrase, nonce: salt);
    final algorithm = AesGcm.with256bits();
    final clear = await algorithm.decrypt(
      SecretBox(cipherText, nonce: nonce, mac: Mac(mac)),
      secretKey: key,
    );
    return Uint8List.fromList(clear);
  }

  List<int> _randomBytes(int length) {
    final rng = Random.secure();
    return List<int>.generate(length, (_) => rng.nextInt(256));
  }
}
