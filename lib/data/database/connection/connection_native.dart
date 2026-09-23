import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

Future<File> resolveDbFile() async {
  final dir = await getApplicationSupportDirectory();
  final dbFolder = Directory(p.join(dir.path, 'database'));
  if (!await dbFolder.exists()) {
    await dbFolder.create(recursive: true);
  }
  return File(p.join(dbFolder.path, 'editing_editorial_hub.db'));
}

QueryExecutor openConnection() {
  return LazyDatabase(() async {
    final file = await resolveDbFile();
    return NativeDatabase.createInBackground(file);
  });
}
