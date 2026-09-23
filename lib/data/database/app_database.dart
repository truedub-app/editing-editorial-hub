import 'package:drift/drift.dart';

import 'connection/connection.dart';
import 'tables/blacklist_table.dart';
import 'tables/contact_table.dart';
import 'tables/manual_tables.dart';
import 'tables/rota_tables.dart';
import 'tables/staff_table.dart';
import 'tables/system_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Staff,
    RotaAssignment,
    DutyAssignment,
    ShiftCode,
    ManualCategory,
    ManualDocument,
    SegContentCategoryRow,
    SegSpecialFileGroupRow,
    SegGlossaryRow,
    Contact,
    BlacklistEntry,
    ImportRecord,
    AuditLogEntry,
    AppSetting,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
      );
}
