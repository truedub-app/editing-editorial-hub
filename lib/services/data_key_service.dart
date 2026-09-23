import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'encryption_service.dart';

/// Owns the data-encryption key (DEK) used by [EncryptionService] for
/// sensitive fields (blacklist reason/source/notes, contact notes). The key
/// lives only in OS-backed secure storage (Keychain / Keystore / Windows
/// Credential Locker / browser storage on web) — generated once on first
/// run and reused after that. There is no PIN or biometric gate on top of
/// it; the app is open once launched, matching how the department actually
/// wants to use it on shared studio-floor devices.
class DataKeyService extends ChangeNotifier {
  DataKeyService() : _storage = const FlutterSecureStorage();

  static const _dekKey = 'eeh_dek_v1';

  final FlutterSecureStorage _storage;
  bool _ready = false;
  SecretKey? _dataKey;

  bool get ready => _ready;
  SecretKey? get dataKey => _dataKey;

  Future<void> bootstrap() async {
    final existing = await _storage.read(key: _dekKey);
    if (existing != null) {
      _dataKey = EncryptionService.keyFromBytes(base64Decode(existing));
    } else {
      final dek = await EncryptionService.generateKey();
      final bytes = await dek.extractBytes();
      await _storage.write(key: _dekKey, value: base64Encode(bytes));
      _dataKey = EncryptionService.keyFromBytes(bytes);
    }
    _ready = true;
    notifyListeners();
  }
}
