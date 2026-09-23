import 'package:drift/drift.dart';

/// Restricted-information records. reason/source/notes are AES-256-GCM
/// encrypted (base64) — see EncryptionService. The whole module is gated by
/// a PIN/biometric screen at the UI layer.
class BlacklistEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  // Actors | Journalists | Presenters | Contributors | Other
  TextColumn get category => text()();
  TextColumn get aliases => text().nullable()();
  TextColumn get programs => text().nullable()();
  TextColumn get status => text()();
  TextColumn get reasonEncrypted => text().nullable()();
  TextColumn get sourceEncrypted => text().nullable()();
  DateTimeColumn get dateAdded => dateTime()();
  DateTimeColumn get lastReviewed => dateTime().nullable()();
  TextColumn get reviewOwner => text().nullable()();
  TextColumn get notesEncrypted => text().nullable()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
}
