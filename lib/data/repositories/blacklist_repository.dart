import 'package:cryptography/cryptography.dart';
import 'package:drift/drift.dart';

import '../../services/encryption_service.dart';
import '../database/app_database.dart';
import 'system_repository.dart';

class BlacklistRepository {
  BlacklistRepository(this._db, this._systemRepository) : _encryption = EncryptionService();
  final AppDatabase _db;
  final SystemRepository _systemRepository;
  final EncryptionService _encryption;

  Stream<List<BlacklistEntryData>> watchAll({String? category}) {
    final query = _db.select(_db.blacklistEntry)
      ..where((t) => t.active.equals(true))
      ..orderBy([(t) => OrderingTerm(expression: t.name)]);
    if (category != null) {
      query.where((t) => t.category.equals(category));
    }
    return query.watch();
  }

  Future<int> createEntry({
    required String name,
    required String category,
    required String status,
    String? aliases,
    String? programs,
    String? reasonPlain,
    String? sourcePlain,
    String? notesPlain,
    String? reviewOwner,
    SecretKey? key,
    String? actor,
  }) async {
    final id = await _db.into(_db.blacklistEntry).insert(BlacklistEntryCompanion.insert(
          name: name,
          category: category,
          status: status,
          aliases: Value(aliases),
          programs: Value(programs),
          reasonEncrypted: Value(await _encryptOrNull(reasonPlain, key)),
          sourceEncrypted: Value(await _encryptOrNull(sourcePlain, key)),
          notesEncrypted: Value(await _encryptOrNull(notesPlain, key)),
          dateAdded: DateTime.now(),
          reviewOwner: Value(reviewOwner),
        ));
    await _systemRepository.logAudit(
      actor: actor,
      action: 'create',
      entity: 'BlacklistEntry',
      entityId: id,
      details: name,
    );
    return id;
  }

  Future<String?> _encryptOrNull(String? plain, SecretKey? key) async {
    if (plain == null || plain.isEmpty || key == null) return null;
    return _encryption.encryptText(plain, key);
  }

  Future<Map<String, String?>> readSensitiveFields(BlacklistEntryData entry, SecretKey key, {String? actor}) async {
    await _systemRepository.logAudit(
      actor: actor,
      action: 'view',
      entity: 'BlacklistEntry',
      entityId: entry.id,
      details: entry.name,
    );
    return {
      'reason': entry.reasonEncrypted != null
          ? await _encryption.decryptText(entry.reasonEncrypted!, key)
          : null,
      'source': entry.sourceEncrypted != null
          ? await _encryption.decryptText(entry.sourceEncrypted!, key)
          : null,
      'notes': entry.notesEncrypted != null
          ? await _encryption.decryptText(entry.notesEncrypted!, key)
          : null,
    };
  }

  Future<void> markReviewed(int id, {String? reviewOwner, String? actor}) async {
    await (_db.update(_db.blacklistEntry)..where((t) => t.id.equals(id))).write(
      BlacklistEntryCompanion(
        lastReviewed: Value(DateTime.now()),
        reviewOwner: Value(reviewOwner),
      ),
    );
    await _systemRepository.logAudit(
      actor: actor,
      action: 'review',
      entity: 'BlacklistEntry',
      entityId: id,
    );
  }

  Future<void> deactivate(int id, {String? actor}) async {
    await (_db.update(_db.blacklistEntry)..where((t) => t.id.equals(id)))
        .write(const BlacklistEntryCompanion(active: Value(false)));
    await _systemRepository.logAudit(actor: actor, action: 'deactivate', entity: 'BlacklistEntry', entityId: id);
  }

  Future<List<BlacklistEntryData>> expiredReviews({int staleAfterDays = 90}) async {
    final all = await _db.select(_db.blacklistEntry).get();
    final cutoff = DateTime.now().subtract(Duration(days: staleAfterDays));
    return all.where((e) => e.lastReviewed == null || e.lastReviewed!.isBefore(cutoff)).toList();
  }
}
