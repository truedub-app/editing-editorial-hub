import 'package:drift/drift.dart';

import '../database/app_database.dart';

class ManualRepository {
  ManualRepository(this._db);
  final AppDatabase _db;

  Stream<List<ManualCategoryData>> watchCategories() =>
      (_db.select(_db.manualCategory)..orderBy([(t) => OrderingTerm(expression: t.name)])).watch();

  Stream<List<ManualDocumentData>> watchDocuments({int? categoryId, String? searchQuery}) {
    final query = _db.select(_db.manualDocument)
      ..orderBy([(t) => OrderingTerm(expression: t.title)]);
    if (categoryId != null) {
      query.where((t) => t.categoryId.equals(categoryId));
    }
    return query.watch().map((docs) {
      if (searchQuery == null || searchQuery.trim().isEmpty) return docs;
      final q = searchQuery.trim().toLowerCase();
      return docs.where((d) {
        return d.title.toLowerCase().contains(q) ||
            (d.description?.toLowerCase().contains(q) ?? false) ||
            (d.reference?.toLowerCase().contains(q) ?? false) ||
            (d.bodyText?.toLowerCase().contains(q) ?? false);
      }).toList();
    });
  }

  Stream<List<ManualDocumentData>> watchRecentlyOpened({int limit = 5}) {
    final query = _db.select(_db.manualDocument)
      ..where((t) => t.lastOpenedAt.isNotNull())
      ..orderBy([(t) => OrderingTerm.desc(t.lastOpenedAt)])
      ..limit(limit);
    return query.watch();
  }

  Future<void> markOpened(int documentId) async {
    await (_db.update(_db.manualDocument)..where((t) => t.id.equals(documentId)))
        .write(ManualDocumentCompanion(lastOpenedAt: Value(DateTime.now())));
  }

  Future<int> createDocument(ManualDocumentCompanion companion) =>
      _db.into(_db.manualDocument).insert(companion);

  Future<List<ManualDocumentData>> documentsWithoutExtractedText() async {
    final all = await _db.select(_db.manualDocument).get();
    return all.where((d) => d.bodyText == null || d.bodyText!.trim().isEmpty).toList();
  }

  // ---- Segmentation Map ----

  Stream<List<SegContentCategoryRowData>> watchContentCategoryRows() =>
      _db.select(_db.segContentCategoryRow).watch();

  Stream<List<SegSpecialFileGroupRowData>> watchSpecialFileGroupRows({String? channel}) {
    final query = _db.select(_db.segSpecialFileGroupRow);
    if (channel != null) {
      query.where((t) => t.channel.equals(channel));
    }
    return query.watch();
  }

  Stream<List<SegGlossaryRowData>> watchGlossaryRows() => _db.select(_db.segGlossaryRow).watch();
}
