import 'dart:convert';
import 'dart:math';

import 'package:cryptography/cryptography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

import 'encryption_service.dart';

/// Gates the app (and, separately, the Blacklist module) behind a PIN with
/// optional biometric convenience. Also owns the data-encryption key (DEK)
/// used by [EncryptionService] for sensitive fields — the DEK lives only in
/// OS-backed secure storage (Keychain / Keystore / Windows Credential
/// Locker), never in the plain SQLite file.
class AuthService extends ChangeNotifier {
  AuthService()
      : _storage = const FlutterSecureStorage(),
        _localAuth = LocalAuthentication();

  static const _dekKey = 'eeh_dek_v1';
  static const _pinSaltKey = 'eeh_pin_salt_v1';
  static const _pinVerifierKey = 'eeh_pin_verifier_v1';
  static const _pbkdf2Iterations = 200000;

  final FlutterSecureStorage _storage;
  final LocalAuthentication _localAuth;
  final _rng = Random.secure();

  bool _ready = false;
  bool _hasPin = false;
  bool _isUnlocked = false;
  SecretKey? _dataKey;

  bool get ready => _ready;
  bool get hasPin => _hasPin;
  bool get isUnlocked => _isUnlocked;
  SecretKey? get dataKey => _dataKey;

  Future<void> bootstrap() async {
    final salt = await _storage.read(key: _pinSaltKey);
    _hasPin = salt != null;
    _ready = true;
    notifyListeners();
  }

  Future<bool> get biometricAvailable async {
    try {
      return await _localAuth.isDeviceSupported() && await _localAuth.canCheckBiometrics;
    } catch (_) {
      return false;
    }
  }

  List<int> _randomBytes(int length) => List<int>.generate(length, (_) => _rng.nextInt(256));

  Future<SecretKey> _deriveVerifier(String pin, List<int> salt) {
    return Pbkdf2.hmacSha256(iterations: _pbkdf2Iterations, bits: 256)
        .deriveKeyFromPassword(password: pin, nonce: salt);
  }

  bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }

  /// First-run setup: generates a random DEK and stores a PBKDF2 verifier
  /// for the chosen PIN. Unlocks immediately afterward.
  Future<void> setupPin(String pin) async {
    final dek = await EncryptionService.generateKey();
    final dekBytes = await dek.extractBytes();
    await _storage.write(key: _dekKey, value: base64Encode(dekBytes));

    final salt = _randomBytes(16);
    final verifier = await _deriveVerifier(pin, salt);
    final verifierBytes = await verifier.extractBytes();
    await _storage.write(key: _pinSaltKey, value: base64Encode(salt));
    await _storage.write(key: _pinVerifierKey, value: base64Encode(verifierBytes));

    _hasPin = true;
    _dataKey = EncryptionService.keyFromBytes(dekBytes);
    _isUnlocked = true;
    notifyListeners();
  }

  Future<bool> unlockWithPin(String pin) async {
    final saltB64 = await _storage.read(key: _pinSaltKey);
    final verifierB64 = await _storage.read(key: _pinVerifierKey);
    if (saltB64 == null || verifierB64 == null) return false;

    final salt = base64Decode(saltB64);
    final candidate = await _deriveVerifier(pin, salt);
    final candidateBytes = await candidate.extractBytes();
    final storedBytes = base64Decode(verifierB64);

    if (!_constantTimeEquals(candidateBytes, storedBytes)) return false;

    final dekB64 = await _storage.read(key: _dekKey);
    if (dekB64 == null) return false;
    _dataKey = EncryptionService.keyFromBytes(base64Decode(dekB64));
    _isUnlocked = true;
    notifyListeners();
    return true;
  }

  Future<bool> unlockWithBiometrics() async {
    if (!_hasPin) return false;
    try {
      final ok = await _localAuth.authenticate(
        localizedReason: 'Unlock Editing & Editorial Hub',
        biometricOnly: true,
      );
      if (!ok) return false;
    } catch (_) {
      return false;
    }
    final dekB64 = await _storage.read(key: _dekKey);
    if (dekB64 == null) return false;
    _dataKey = EncryptionService.keyFromBytes(base64Decode(dekB64));
    _isUnlocked = true;
    notifyListeners();
    return true;
  }

  void lock() {
    _dataKey = null;
    _isUnlocked = false;
    notifyListeners();
  }
}
