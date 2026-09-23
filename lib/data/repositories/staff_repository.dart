import 'package:drift/drift.dart';

import '../database/app_database.dart';

class StaffRepository {
  StaffRepository(this._db);
  final AppDatabase _db;

  Stream<List<StaffData>> watchAll({bool activeOnly = false}) {
    final query = _db.select(_db.staff)
      ..orderBy([(t) => OrderingTerm(expression: t.fullName)]);
    if (activeOnly) {
      query.where((t) => t.active.equals(true));
    }
    return query.watch();
  }

  Future<List<StaffData>> getAll({bool activeOnly = false}) {
    final query = _db.select(_db.staff)
      ..orderBy([(t) => OrderingTerm(expression: t.fullName)]);
    if (activeOnly) {
      query.where((t) => t.active.equals(true));
    }
    return query.get();
  }

  Future<StaffData?> byId(int id) =>
      (_db.select(_db.staff)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// Trim + collapse-whitespace match against stored full names, used by the
  /// importer to reconcile the source file's free-text names.
  Future<StaffData?> findByNormalizedName(String name) async {
    final normalized = _normalize(name);
    final all = await getAll();
    for (final s in all) {
      if (_normalize(s.fullName) == normalized) return s;
    }
    return null;
  }

  String _normalize(String s) =>
      s.replaceAll(' ', ' ').replaceAll(RegExp(r'\s+'), ' ').trim().toLowerCase();

  String initialsFor(String fullName) {
    final parts = fullName.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1)).toUpperCase();
  }

  Future<int> insertStaff(StaffCompanion companion) => _db.into(_db.staff).insert(companion);

  Future<bool> updateStaff(StaffData row) =>
      _db.update(_db.staff).replace(row);

  Future<void> deactivate(int id) => (_db.update(_db.staff)..where((t) => t.id.equals(id)))
      .write(const StaffCompanion(active: Value(false)));

  Future<List<StaffData>> duplicateNameGroups() async {
    final all = await getAll();
    final byName = <String, List<StaffData>>{};
    for (final s in all) {
      byName.putIfAbsent(_normalize(s.fullName), () => []).add(s);
    }
    return byName.values.where((g) => g.length > 1).expand((g) => g).toList();
  }
}
