import 'package:drift/drift.dart';
import 'staff_table.dart';

class Contact extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get jobTitle => text().nullable()();
  TextColumn get team => text()();
  TextColumn get channels => text().nullable()();
  TextColumn get areas => text().nullable()();
  TextColumn get extension => text().nullable()();
  TextColumn get email => text().nullable()();
  // AES-256-GCM encrypted, base64-encoded.
  TextColumn get notesEncrypted => text().nullable()();
  BoolColumn get favorite => boolean().withDefault(const Constant(false))();
  // Set when this contact was auto-populated from an imported Staff record.
  IntColumn get linkedStaffId => integer().nullable().references(Staff, #id)();
}
