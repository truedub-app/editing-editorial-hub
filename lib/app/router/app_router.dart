import 'package:go_router/go_router.dart';

import '../../features/blacklist/blacklist_screen.dart';
import '../../features/contacts/contacts_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/manual/manual_reader_screen.dart';
import '../../features/manual/manual_screen.dart';
import '../../features/manual/segmentation_map_screen.dart';
import '../../features/rota/rota_screen.dart';
import '../../features/settings/backup_screen.dart';
import '../../features/settings/import_rota_screen.dart';
import '../../features/settings/more_screen.dart';
import '../../features/settings/settings_screen.dart';
import '../navigation/responsive_scaffold.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          ResponsiveScaffold(currentPath: state.uri.path, child: child),
      routes: [
        GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
        GoRoute(path: '/rota', builder: (context, state) => const RotaScreen()),
        GoRoute(
          path: '/manual',
          builder: (context, state) => const ManualScreen(),
          routes: [
            GoRoute(
              path: 'segmentation',
              builder: (context, state) => const SegmentationMapScreen(),
            ),
            GoRoute(
              path: 'document/:id',
              builder: (context, state) =>
                  ManualReaderScreen(documentId: int.parse(state.pathParameters['id']!)),
            ),
          ],
        ),
        GoRoute(path: '/contacts', builder: (context, state) => const ContactsScreen()),
        GoRoute(path: '/blacklist', builder: (context, state) => const BlacklistScreen()),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
          routes: [
            GoRoute(path: 'import-rota', builder: (context, state) => const ImportRotaScreen()),
            GoRoute(path: 'backup', builder: (context, state) => const BackupScreen()),
          ],
        ),
        GoRoute(path: '/more', builder: (context, state) => const MoreScreen()),
      ],
    ),
  ],
);
