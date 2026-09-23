import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'package:provider/provider.dart';

import 'app/router/app_router.dart';
import 'app/theme/app_theme.dart';
import 'data/database/app_database.dart';
import 'data/repositories/blacklist_repository.dart';
import 'data/repositories/contacts_repository.dart';
import 'data/repositories/manual_repository.dart';
import 'data/repositories/rota_repository.dart';
import 'data/repositories/staff_repository.dart';
import 'data/repositories/system_repository.dart';
import 'data/seed_data.dart';
import 'services/backup_service.dart';
import 'services/data_key_service.dart';
import 'services/excel_import_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  runApp(const AppRoot());
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  late final AppDatabase _db;
  late final DataKeyService _dataKeyService;
  late final Future<void> _initialization;

  @override
  void initState() {
    super.initState();
    _db = AppDatabase();
    _dataKeyService = DataKeyService();
    _initialization = Future.wait([
      _dataKeyService.bootstrap(),
      seedIfNeeded(_db),
    ]);
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        }

        final staffRepository = StaffRepository(_db);
        final rotaRepository = RotaRepository(_db);
        final systemRepository = SystemRepository(_db);
        final contactsRepository = ContactsRepository(_db);
        final blacklistRepository = BlacklistRepository(_db, systemRepository);
        final manualRepository = ManualRepository(_db);
        final excelImportService = ExcelImportService(
          staffRepository: staffRepository,
          rotaRepository: rotaRepository,
          systemRepository: systemRepository,
          contactsRepository: contactsRepository,
        );
        final backupService = BackupService();

        return MultiProvider(
          providers: [
            ChangeNotifierProvider<DataKeyService>.value(value: _dataKeyService),
            Provider<AppDatabase>.value(value: _db),
            Provider<StaffRepository>.value(value: staffRepository),
            Provider<RotaRepository>.value(value: rotaRepository),
            Provider<SystemRepository>.value(value: systemRepository),
            Provider<ContactsRepository>.value(value: contactsRepository),
            Provider<BlacklistRepository>.value(value: blacklistRepository),
            Provider<ManualRepository>.value(value: manualRepository),
            Provider<ExcelImportService>.value(value: excelImportService),
            Provider<BackupService>.value(value: backupService),
          ],
          child: MaterialApp.router(
            title: 'Editing & Editorial Hub',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.dark,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.dark,
            routerConfig: appRouter,
          ),
        );
      },
    );
  }
}
