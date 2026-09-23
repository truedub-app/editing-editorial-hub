import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../services/excel_import_service.dart';

class ImportRotaScreen extends StatefulWidget {
  const ImportRotaScreen({super.key});

  @override
  State<ImportRotaScreen> createState() => _ImportRotaScreenState();
}

class _ImportRotaScreenState extends State<ImportRotaScreen> {
  bool _busy = false;
  String? _error;
  List<ImportPreview>? _previews;
  int _selectedPreview = 0;
  bool _imported = false;

  Future<void> _pickAndParse() async {
    setState(() {
      _busy = true;
      _error = null;
      _previews = null;
      _imported = false;
    });
    try {
      final file = await FilePicker.pickFile(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        dialogTitle: 'Select the ROTA Excel file',
      );
      if (file == null) {
        setState(() => _busy = false);
        return;
      }
      final bytes = await file.readAsBytes();
      if (!mounted) return;
      final service = context.read<ExcelImportService>();
      final previews = await service.buildPreviews(bytes, file.name);
      setState(() {
        _previews = previews;
        _busy = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Could not read that file: $e';
        _busy = false;
      });
    }
  }

  Future<void> _confirm() async {
    final preview = _previews![_selectedPreview];
    setState(() => _busy = true);
    final service = context.read<ExcelImportService>();
    await service.confirmImport(preview, importedBy: 'Local admin');
    setState(() {
      _busy = false;
      _imported = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Import ROTA')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _previews == null ? _buildPickStep() : _buildPreviewStep(),
      ),
    );
  }

  Widget _buildPickStep() {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.upload_file_outlined, size: 56, color: AppColors.primaryBlue),
            const SizedBox(height: 16),
            const Text('Select the official monthly ROTA Excel file (.xlsx) to import.',
                textAlign: TextAlign.center),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _busy ? null : _pickAndParse,
              icon: _busy
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.folder_open),
              label: const Text('Select Excel file'),
            ),
            if (_error != null) ...[
              const SizedBox(height: 16),
              Text(_error!, style: const TextStyle(color: AppColors.errorRed)),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewStep() {
    if (_imported) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 56, color: AppColors.qc2Green),
            const SizedBox(height: 16),
            const Text('Rota imported successfully.'),
            const SizedBox(height: 20),
            FilledButton(onPressed: () => context.go('/rota'), child: const Text('View ROTA')),
          ],
        ),
      );
    }

    final preview = _previews![_selectedPreview];
    return ListView(
      children: [
        if (_previews!.length > 1)
          DropdownButton<int>(
            value: _selectedPreview,
            items: List.generate(
              _previews!.length,
              (i) => DropdownMenuItem(value: i, child: Text('Sheet: ${_previews![i].parsed.sheetName}')),
            ),
            onChanged: (v) => setState(() => _selectedPreview = v ?? 0),
          ),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Import summary', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                _summaryLine('✓', '${preview.staffFoundCount} existing staff matched', AppColors.qc2Green),
                if (preview.staffNewCount > 0)
                  _summaryLine('⚠', '${preview.staffNewCount} unknown staff name(s) — will be created as new',
                      AppColors.warningOrange),
                _summaryLine('✓', '${preview.dayCount} schedule days found', AppColors.qc2Green),
                _summaryLine('✓', '${preview.cellsProcessed} shift cells processed', AppColors.qc2Green),
                _summaryLine('✓', '${preview.inChargeCellCount} in-charge assignments detected (yellow cells)',
                    AppColors.inChargeYellow),
                _summaryLine('✓', '${preview.qc2CellCount} QC 2 / missing-list duties detected', AppColors.qc2Green),
                if (preview.warnings.isNotEmpty)
                  _summaryLine('⚠', '${preview.warnings.length} warning(s)', AppColors.warningOrange),
              ],
            ),
          ),
        ),
        if (preview.unknownNames.isNotEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('New staff to be created', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ...preview.unknownNames.map((n) => Text('• $n')),
                ],
              ),
            ),
          ),
        if (preview.warnings.isNotEmpty)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Warnings', style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  ...preview.warnings.map((w) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text('⚠ $w', style: const TextStyle(color: AppColors.warningOrange, fontSize: 13)),
                      )),
                ],
              ),
            ),
          ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => setState(() => _previews = null),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 12),
            FilledButton(
              onPressed: _busy ? null : _confirm,
              child: _busy
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : const Text('Confirm import'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _summaryLine(String symbol, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Text(symbol, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
