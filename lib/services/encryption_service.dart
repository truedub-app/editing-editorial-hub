import 'dart:convert';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

/// AES-256-GCM helpers for field-level encryption of sensitive text (used
/// for blacklist reason/source/notes and contact notes). Callers hold a
/// [SecretKey] obtained from [AuthService] while the app is unlocked.
///
/// This is deliberately *not* whole-database encryption (see the project
/// plan for why SQLCipher on Windows desktop FFI was judged too risky to
/// depend on for this build) — it protects the sensitive text fields
/// themselves, with the key held only in OS-backed secure storage.
class EncryptionService {
  EncryptionService() : _algorithm = AesGcm.with256bits();

  final AesGcm _algorithm;

  static Future<SecretKey> generateKey() => AesGcm.with256bits().newSecretKey();

  static SecretKey keyFromBytes(List<int> bytes) => SecretKey(bytes);

  /// Encodes as base64(nonce + mac + cipherText).
  Future<String> encryptText(String plainText, SecretKey key) async {
    final nonce = _algorithm.newNonce();
    final box = await _algorithm.encrypt(
      utf8.encode(plainText),
      secretKey: key,
      nonce: nonce,
    );
    final packed = BytesBuilder()
      ..add(box.nonce)
      ..add(box.mac.bytes)
      ..add(box.cipherText);
    return base64Encode(packed.toBytes());
  }

  Future<String> decryptText(String encoded, SecretKey key) async {
    final raw = base64Decode(encoded);
    final nonce = raw.sublist(0, 12);
    final mac = raw.sublist(12, 28);
    final cipherText = raw.sublist(28);
    final clear = await _algorithm.decrypt(
      SecretBox(cipherText, nonce: nonce, mac: Mac(mac)),
      secretKey: key,
    );
    return utf8.decode(clear);
  }
}
