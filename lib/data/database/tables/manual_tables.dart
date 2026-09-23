import 'package:drift/drift.dart';

class ManualCategory extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
  TextColumn get colorHex => text()();
  TextColumn get icon => text()();
}

class ManualDocument extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get categoryId => integer().references(ManualCategory, #id)();
  TextColumn get reference => text().nullable()();
  TextColumn get version => text().nullable()();
  TextColumn get description => text().nullable()();
  // pdf | video | procedure
  TextColumn get fileType => text()();
  TextColumn get localFilePath => text().nullable()();
  IntColumn get pageCount => integer().nullable()();
  IntColumn get durationSeconds => integer().nullable()();
  IntColumn get fileSizeBytes => integer().nullable()();
  TextColumn get bodyText => text().nullable()();
  TextColumn get owningTeam => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  DateTimeColumn get lastOpenedAt => dateTime().nullable()();
}

/// Segmentation Map — Table 1 (spec section 12).
class SegContentCategoryRow extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get contentCategory => text()();
  TextColumn get shahidSegmentation => text().nullable()();
  TextColumn get mbcSegmentation => text().nullable()();
  TextColumn get requiredNotes => text().nullable()();
  TextColumn get examples => text().nullable()();
}

/// Segmentation Map — Table 2.
class SegSpecialFileGroupRow extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get fileGroup => text()();
  TextColumn get usage => text().nullable()();
  TextColumn get channel => text().nullable()();
  TextColumn get requiredTreatment => text().nullable()();
  TextColumn get notes => text().nullable()();
}

/// Segmentation Map — Table 3 (comments glossary).
class SegGlossaryRow extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get term => text()();
  TextColumn get meaning => text().nullable()();
  TextColumn get example => text().nullable()();
  TextColumn get relatedProcedure => text().nullable()();
}
