import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/blacklist_repository.dart';
import '../../data/repositories/contacts_repository.dart';
import '../../data/repositories/manual_repository.dart';
import '../../data/repositories/staff_repository.dart';
import '../../data/repositories/system_repository.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SectionLabel('Data management'),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.upload_file_outlined),
                  title: const Text('Import ROTA'),
                  subtitle: const Text('Import the official monthly Excel schedule'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/settings/import-rota'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.archive_outlined),
                  title: const Text('Export / Restore backup'),
                  subtitle: const Text('Create or restore an encrypted .hub package'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => context.go('/settings/backup'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.badge_outlined),
                  title: const Text('Manage staff'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _showStaffManager(context),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _SectionLabel('Data integrity'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _DataIntegrityPanel(),
            ),
          ),
          const SizedBox(height: 20),
          _SectionLabel('Status'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _StatusPanel(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showStaffManager(BuildContext context) async {
    final staffRepo = context.read<StaffRepository>();
    await showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480, maxHeight: 560),
          child: StreamBuilder<List<StaffData>>(
            stream: staffRepo.watchAll(),
            builder: (context, snapshot) {
              final staff = snapshot.data ?? [];
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text('Manage staff', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: staff.length,
                      itemBuilder: (context, i) {
                        final s = staff[i];
                        return ListTile(
                          title: Text(s.fullName),
                          subtitle: Text('${s.homeSection} · ext: ${s.extension ?? '—'} · ${s.email ?? '—'}'),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit_outlined, size: 18),
                            onPressed: () => _editStaff(context, s),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close')),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _editStaff(BuildContext context, StaffData s) async {
    final staffRepo = context.read<StaffRepository>();
    final extCtrl = TextEditingController(text: s.extension ?? '');
    final emailCtrl = TextEditingController(text: s.email ?? '');
    final titleCtrl = TextEditingController(text: s.jobTitle ?? '');

    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(s.fullName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: 'Job title')),
            TextField(controller: extCtrl, decoration: const InputDecoration(labelText: 'Extension')),
            TextField(controller: emailCtrl, decoration: const InputDecoration(labelText: 'Email')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () async {
              await staffRepo.updateStaff(s.copyWith(
                jobTitle: Value(titleCtrl.text.trim().isEmpty ? null : titleCtrl.text.trim()),
                extension: Value(extCtrl.text.trim().isEmpty ? null : extCtrl.text.trim()),
                email: Value(emailCtrl.text.trim().isEmpty ? null : emailCtrl.text.trim()),
              ));
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(text.toUpperCase(),
          style: const TextStyle(fontSize: 12, color: AppColors.mutedText, letterSpacing: 0.6)),
    );
  }
}

class _DataIntegrityPanel extends StatefulWidget {
  @override
  State<_DataIntegrityPanel> createState() => _DataIntegrityPanelState();
}

class _DataIntegrityPanelState extends State<_DataIntegrityPanel> {
  List<String>? _issues;
  bool _busy = false;

  Future<void> _run(BuildContext context) async {
    setState(() => _busy = true);
    final staffRepo = context.read<StaffRepository>();
    final contactsRepo = context.read<ContactsRepository>();
    final manualRepo = context.read<ManualRepository>();
    final blacklistRepo = context.read<BlacklistRepository>();

    final issues = <String>[];
    final dupes = await staffRepo.duplicateNameGroups();
    if (dupes.isNotEmpty) {
      issues.add('${dupes.length} duplicate staff name(s) found.');
    }
    final missingContacts = await contactsRepo.missingDetails();
    if (missingContacts.isNotEmpty) {
      issues.add('${missingContacts.length} contact(s) missing extension/email.');
    }
    final noText = await manualRepo.documentsWithoutExtractedText();
    if (noText.isNotEmpty) {
      issues.add('${noText.length} manual document(s) without extracted text.');
    }
    final expired = await blacklistRepo.expiredReviews();
    if (expired.isNotEmpty) {
      issues.add('${expired.length} blacklist entr(y/ies) overdue for review.');
    }
    final invalidSection = (await staffRepo.getAll())
        .where((s) => s.homeSection.isEmpty || s.homeSection == 'Unassigned')
        .length;
    if (invalidSection > 0) {
      issues.add('$invalidSection staff member(s) with an unassigned home section.');
    }

    if (mounted) {
      setState(() {
        _issues = issues;
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(child: Text('Check for missing details, duplicates and incomplete records.')),
            FilledButton(
              onPressed: _busy ? null : () => _run(context),
              child: _busy
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Run checks'),
            ),
          ],
        ),
        if (_issues != null) ...[
          const SizedBox(height: 12),
          if (_issues!.isEmpty)
            const Text('No issues found.', style: TextStyle(color: AppColors.qc2Green))
          else
            ..._issues!.map((i) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text('⚠ $i', style: const TextStyle(color: AppColors.warningOrange)),
                )),
        ],
      ],
    );
  }
}

class _StatusPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final systemRepo = context.read<SystemRepository>();
    return FutureBuilder(
      future: Future.wait([
        systemRepo.countStaff(),
        systemRepo.countContacts(),
        systemRepo.countManualDocuments(),
        systemRepo.getSetting('last_import_at'),
        systemRepo.getSetting('data_version_counter'),
      ]),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        final data = snapshot.data!;
        final lastImportRaw = data[3] as String?;
        final lastImport = lastImportRaw != null ? DateTime.tryParse(lastImportRaw) : null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _statusRow('Staff records', '${data[0]}'),
            _statusRow('Contacts', '${data[1]}'),
            _statusRow('Manual documents', '${data[2]}'),
            _statusRow('Last import', lastImport != null ? DateFormat('d MMM yyyy, HH:mm').format(lastImport) : 'Never'),
            _statusRow('Data version', '${data[4] ?? '0'}'),
          ],
        );
      },
    );
  }

  Widget _statusRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            SizedBox(width: 160, child: Text(label, style: const TextStyle(color: AppColors.mutedText))),
            Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
      );
}
