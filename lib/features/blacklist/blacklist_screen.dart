import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/blacklist_repository.dart';
import '../../services/auth_service.dart';

const _categories = ['Actors', 'Journalists', 'Presenters', 'Contributors', 'Other'];

class BlacklistScreen extends StatefulWidget {
  const BlacklistScreen({super.key});

  @override
  State<BlacklistScreen> createState() => _BlacklistScreenState();
}

class _BlacklistScreenState extends State<BlacklistScreen> {
  String? _category;
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final repo = context.read<BlacklistRepository>();
    return Scaffold(
      appBar: AppBar(title: const Text('Blacklist')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search, size: 20),
                hintText: 'Search name, program or note',
                isDense: true,
              ),
              onChanged: (v) => setState(() => _search = v),
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: const Text('All'),
                    selected: _category == null,
                    onSelected: (_) => setState(() => _category = null),
                  ),
                ),
                for (final c in _categories)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(c),
                      selected: _category == c,
                      onSelected: (_) => setState(() => _category = c),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<BlacklistEntryData>>(
              stream: repo.watchAll(category: _category),
              builder: (context, snapshot) {
                var entries = snapshot.data ?? [];
                if (_search.isNotEmpty) {
                  final q = _search.toLowerCase();
                  entries = entries.where((e) =>
                      e.name.toLowerCase().contains(q) ||
                      (e.programs?.toLowerCase().contains(q) ?? false) ||
                      (e.aliases?.toLowerCase().contains(q) ?? false)).toList();
                }
                if (entries.isEmpty) {
                  return const Center(
                    child: Text('No blacklist entries found.',
                        style: TextStyle(color: AppColors.mutedText)),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: entries.length,
                  itemBuilder: (context, i) => _BlacklistCard(entry: entries[i]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddDialog(BuildContext context) async {
    final nameCtrl = TextEditingController();
    final programsCtrl = TextEditingController();
    final reasonCtrl = TextEditingController();
    final sourceCtrl = TextEditingController();
    var category = _category ?? _categories.first;
    var status = 'Editorial review required';
    final repo = context.read<BlacklistRepository>();
    final auth = context.read<AuthService>();

    await showDialog<void>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('Add blacklist entry'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(controller: nameCtrl, decoration: const InputDecoration(labelText: 'Name')),
                DropdownButtonFormField<String>(
                  initialValue: category,
                  decoration: const InputDecoration(labelText: 'Category'),
                  items: _categories.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) => setDialogState(() => category = v ?? category),
                ),
                TextField(
                  controller: programsCtrl,
                  decoration: const InputDecoration(labelText: 'Associated channels/programs'),
                ),
                DropdownButtonFormField<String>(
                  initialValue: status,
                  decoration: const InputDecoration(labelText: 'Status'),
                  items: const [
                    DropdownMenuItem(value: 'Do not book', child: Text('Do not book')),
                    DropdownMenuItem(
                        value: 'Editorial review required', child: Text('Editorial review required')),
                    DropdownMenuItem(value: 'Restricted', child: Text('Restricted')),
                  ],
                  onChanged: (v) => setDialogState(() => status = v ?? status),
                ),
                TextField(
                  controller: reasonCtrl,
                  decoration: const InputDecoration(labelText: 'Reason / editorial note'),
                  maxLines: 2,
                ),
                TextField(
                  controller: sourceCtrl,
                  decoration: const InputDecoration(labelText: 'Source / reference'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
            FilledButton(
              onPressed: () async {
                if (nameCtrl.text.trim().isEmpty) return;
                await repo.createEntry(
                  name: nameCtrl.text.trim(),
                  category: category,
                  status: status,
                  programs: programsCtrl.text.trim().isEmpty ? null : programsCtrl.text.trim(),
                  reasonPlain: reasonCtrl.text.trim().isEmpty ? null : reasonCtrl.text.trim(),
                  sourcePlain: sourceCtrl.text.trim().isEmpty ? null : sourceCtrl.text.trim(),
                  key: auth.dataKey,
                  actor: 'Local admin',
                );
                if (context.mounted) Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlacklistCard extends StatelessWidget {
  const _BlacklistCard({required this.entry});
  final BlacklistEntryData entry;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const Icon(Icons.warning_amber_rounded, color: AppColors.errorRed),
        title: Text(entry.name),
        subtitle: Text(
          '${entry.category} · ${entry.status}'
          '${entry.lastReviewed != null ? ' · Last reviewed: ${DateFormat('d MMM yyyy').format(entry.lastReviewed!)}' : ''}',
        ),
        onTap: () => _showDetail(context),
      ),
    );
  }

  Future<void> _showDetail(BuildContext context) async {
    final repo = context.read<BlacklistRepository>();
    final auth = context.read<AuthService>();
    final key = auth.dataKey;
    Map<String, String?> fields = {};
    if (key != null) {
      fields = await repo.readSensitiveFields(entry, key, actor: 'Local admin');
    }
    if (!context.mounted) return;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(entry.name),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${entry.category} · ${entry.status}'),
              if (entry.programs != null) ...[
                const SizedBox(height: 8),
                Text('Programs/channels: ${entry.programs}'),
              ],
              if (fields['reason'] != null) ...[
                const SizedBox(height: 8),
                Text('Reason: ${fields['reason']}'),
              ],
              if (fields['source'] != null) ...[
                const SizedBox(height: 8),
                Text('Source: ${fields['source']}'),
              ],
              const SizedBox(height: 8),
              Text('Added: ${DateFormat('d MMM yyyy').format(entry.dateAdded)}',
                  style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await repo.markReviewed(entry.id, actor: 'Local admin');
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Mark reviewed'),
          ),
          TextButton(
            onPressed: () async {
              await repo.deactivate(entry.id, actor: 'Local admin');
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Remove'),
          ),
          FilledButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
        ],
      ),
    );
  }
}
