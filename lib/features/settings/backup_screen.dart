import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/repositories/system_repository.dart';
import '../../services/backup_service.dart';

class BackupScreen extends StatefulWidget {
  const BackupScreen({super.key});

  @override
  State<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends State<BackupScreen> {
  final _exportPassCtrl = TextEditingController();
  final _importPassCtrl = TextEditingController();
  bool _busy = false;
  String? _message;
  bool _messageIsError = false;

  @override
  void dispose() {
    _exportPassCtrl.dispose();
    _importPassCtrl.dispose();
    super.dispose();
  }

  Future<void> _export() async {
    if (_exportPassCtrl.text.trim().length < 6) {
      setState(() {
        _message = 'Choose a passphrase of at least 6 characters.';
        _messageIsError = true;
      });
      return;
    }
    setState(() {
      _busy = true;
      _message = null;
    });
    final systemRepo = context.read<SystemRepository>();
    final backupService = context.read<BackupService>();
    final version = int.tryParse((await systemRepo.getSetting('data_version_counter')) ?? '0') ?? 0;
    final counts = {
      'staff': await systemRepo.countStaff(),
      'contacts': await systemRepo.countContacts(),
      'documents': await systemRepo.countManualDocuments(),
    };
    final bytes = await backupService.buildEncryptedPackage(
      passphrase: _exportPassCtrl.text.trim(),
      dataVersion: version,
      counts: counts,
    );
    final fileName =
        'EditingEditorialHub_${DateTime.now().toIso8601String().split('T').first}.hub';
    await FilePicker.saveFile(fileName: fileName, bytes: bytes, dialogTitle: 'Save backup package');
    await systemRepo.setSetting('last_backup_at', DateTime.now().toIso8601String());
    setState(() {
      _busy = false;
      _message = 'Backup exported.';
      _messageIsError = false;
    });
  }

  Future<void> _import() async {
    if (_importPassCtrl.text.trim().isEmpty) {
      setState(() {
        _message = 'Enter the backup passphrase first.';
        _messageIsError = true;
      });
      return;
    }
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['hub'],
      dialogTitle: 'Select a .hub backup file',
    );
    if (file == null) return;
    if (!mounted) return;

    setState(() {
      _busy = true;
      _message = null;
    });
    final backupService = context.read<BackupService>();
    try {
      final bytes = await file.readAsBytes();
      final manifest = await backupService.readManifestFromBytes(bytes, _importPassCtrl.text.trim());
      if (!mounted) return;
      final confirmed = await _confirmRestore(manifest);
      if (confirmed != true) {
        setState(() => _busy = false);
        return;
      }
      await backupService.importBackupFromBytes(bytes, _importPassCtrl.text.trim());
      setState(() {
        _busy = false;
        _message = 'Restore complete. Please close and reopen the app for the changes to take effect.';
        _messageIsError = false;
      });
    } catch (e) {
      setState(() {
        _busy = false;
        _message = 'Could not restore that package: incorrect passphrase or corrupt file.';
        _messageIsError = true;
      });
    }
  }

  Future<bool?> _confirmRestore(BackupManifest manifest) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Restore this backup?'),
        content: Text(
          'This will replace ALL local data on this device with the package '
          'exported on ${manifest.exportedAt}.\n\n'
          'Staff: ${manifest.counts['staff']}, Contacts: ${manifest.counts['contacts']}, '
          'Documents: ${manifest.counts['documents']}.\n\n'
          'This cannot be undone.',
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.errorRed),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Restore and overwrite'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Scaffold(
        appBar: AppBar(title: const Text('Backup')),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Backup export/restore is not available in this web preview — it works on the '
            'Windows, Android and iOS builds, which have a real local database file to '
            'package. Open the app on one of those to use this feature.',
            style: TextStyle(color: AppColors.mutedText),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Backup')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Export encrypted backup', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text(
                    'Creates a password-protected .hub package containing the local '
                    'database, which can be transferred by USB, AirDrop or local file share.',
                    style: TextStyle(color: AppColors.mutedText),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _exportPassCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Set a passphrase (min. 6 characters)'),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: _busy ? null : _export,
                    icon: const Icon(Icons.archive_outlined),
                    label: const Text('Export backup'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Restore from backup', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text(
                    'Overwrites all local data on this device with a previously exported package.',
                    style: TextStyle(color: AppColors.mutedText),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _importPassCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Backup passphrase'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: _busy ? null : _import,
                    icon: const Icon(Icons.settings_backup_restore),
                    label: const Text('Select .hub file and restore'),
                  ),
                ],
              ),
            ),
          ),
          if (_message != null) ...[
            const SizedBox(height: 16),
            Text(_message!, style: TextStyle(color: _messageIsError ? AppColors.errorRed : AppColors.qc2Green)),
          ],
        ],
      ),
    );
  }
}
