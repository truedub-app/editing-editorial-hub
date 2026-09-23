import 'package:cryptography/cryptography.dart';
import 'package:drift/drift.dart';

import '../../services/encryption_service.dart';
import '../database/app_database.dart';

class ContactsRepository {
  ContactsRepository(this._db) : _encryption = EncryptionService();
  final AppDatabase _db;
  final EncryptionService _encryption;

  Stream<List<ContactData>> watchAll({String? team, bool favoritesOnly = false}) {
    final query = _db.select(_db.contact)..orderBy([(t) => OrderingTerm(expression: t.name)]);
    if (team != null) {
      query.where((t) => t.team.equals(team));
    }
    if (favoritesOnly) {
      query.where((t) => t.favorite.equals(true));
    }
    return query.watch();
  }

  Future<ContactData?> byLinkedStaff(int staffId) => (_db.select(_db.contact)
        ..where((t) => t.linkedStaffId.equals(staffId)))
      .getSingleOrNull();

  Future<int> createFromStaff(StaffData staff, {required String team}) {
    return _db.into(_db.contact).insert(ContactCompanion.insert(
          name: staff.fullName,
          team: team,
          jobTitle: Value(staff.jobTitle),
          extension: Value(staff.extension),
          email: Value(staff.email),
          linkedStaffId: Value(staff.id),
        ));
  }

  Future<int> createContact({
    required String name,
    required String team,
    String? jobTitle,
    String? channels,
    String? areas,
    String? extension,
    String? email,
    String? notesPlain,
    SecretKey? key,
  }) async {
    String? encryptedNotes;
    if (notesPlain != null && notesPlain.isNotEmpty && key != null) {
      encryptedNotes = await _encryption.encryptText(notesPlain, key);
    }
    return _db.into(_db.contact).insert(ContactCompanion.insert(
          name: name,
          team: team,
          jobTitle: Value(jobTitle),
          channels: Value(channels),
          areas: Value(areas),
          extension: Value(extension),
          email: Value(email),
          notesEncrypted: Value(encryptedNotes),
        ));
  }

  Future<void> updateContact(ContactData row) => _db.update(_db.contact).replace(row);

  Future<void> setFavorite(int id, bool value) => (_db.update(_db.contact)
        ..where((t) => t.id.equals(id)))
      .write(ContactCompanion(favorite: Value(value)));

  Future<String?> readNotes(ContactData contact, SecretKey key) async {
    if (contact.notesEncrypted == null) return null;
    return _encryption.decryptText(contact.notesEncrypted!, key);
  }

  Future<List<ContactData>> missingDetails() async {
    final all = await _db.select(_db.contact).get();
    return all.where((c) => (c.extension == null || c.extension!.isEmpty) &&
        (c.email == null || c.email!.isEmpty)).toList();
  }
}
