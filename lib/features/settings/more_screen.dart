import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('More')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.block_outlined),
            title: const Text('Blacklist'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/blacklist'),
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.upload_file_outlined),
            title: const Text('Import ROTA'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/import-rota'),
          ),
          ListTile(
            leading: const Icon(Icons.archive_outlined),
            title: const Text('Export / Restore backup'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/backup'),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings'),
          ),
        ],
      ),
    );
  }
}
