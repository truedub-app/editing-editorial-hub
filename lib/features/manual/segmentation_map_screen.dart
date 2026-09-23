import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/manual_repository.dart';

class SegmentationMapScreen extends StatefulWidget {
  const SegmentationMapScreen({super.key});

  @override
  State<SegmentationMapScreen> createState() => _SegmentationMapScreenState();
}

class _SegmentationMapScreenState extends State<SegmentationMapScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Segmentation Map'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Content Category'),
            Tab(text: 'Special File Groups'),
            Tab(text: 'Comments Glossary'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          _ContentCategoryTable(),
          _SpecialFileGroupTable(),
          _GlossaryTable(),
        ],
      ),
    );
  }
}

class _SearchableTableScaffold extends StatefulWidget {
  const _SearchableTableScaffold({required this.builder, this.channelFilter});
  final Widget Function(BuildContext context, String search, String? channel) builder;
  final List<String>? channelFilter;

  @override
  State<_SearchableTableScaffold> createState() => _SearchableTableScaffoldState();
}

class _SearchableTableScaffoldState extends State<_SearchableTableScaffold> {
  String _search = '';
  String? _channel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search, size: 20),
                    hintText: 'Search',
                    isDense: true,
                  ),
                  onChanged: (v) => setState(() => _search = v),
                ),
              ),
              if (widget.channelFilter != null) ...[
                const SizedBox(width: 12),
                DropdownButton<String?>(
                  value: _channel,
                  hint: const Text('All channels'),
                  items: [
                    const DropdownMenuItem<String?>(value: null, child: Text('All channels')),
                    ...widget.channelFilter!.map((c) => DropdownMenuItem<String?>(value: c, child: Text(c))),
                  ],
                  onChanged: (v) => setState(() => _channel = v),
                ),
              ],
            ],
          ),
        ),
        Expanded(child: widget.builder(context, _search, _channel)),
      ],
    );
  }
}

void _copyRow(BuildContext context, List<String> values) {
  Clipboard.setData(ClipboardData(text: values.join('\t')));
  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Row copied to clipboard')));
}

class _ContentCategoryTable extends StatelessWidget {
  const _ContentCategoryTable();

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ManualRepository>();
    return _SearchableTableScaffold(
      builder: (context, search, _) => StreamBuilder<List<SegContentCategoryRowData>>(
        stream: repo.watchContentCategoryRows(),
        builder: (context, snapshot) {
          var rows = snapshot.data ?? [];
          if (search.isNotEmpty) {
            final q = search.toLowerCase();
            rows = rows.where((r) =>
                r.contentCategory.toLowerCase().contains(q) ||
                (r.shahidSegmentation?.toLowerCase().contains(q) ?? false) ||
                (r.mbcSegmentation?.toLowerCase().contains(q) ?? false)).toList();
          }
          if (rows.isEmpty) return const _EmptyTableState();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Content Category')),
                DataColumn(label: Text('Shahid Segmentation')),
                DataColumn(label: Text('MBC Channel Segmentation')),
                DataColumn(label: Text('Required Notes')),
                DataColumn(label: Text('Examples')),
                DataColumn(label: Text('')),
              ],
              rows: rows
                  .map((r) => DataRow(cells: [
                        DataCell(Text(r.contentCategory)),
                        DataCell(Text(r.shahidSegmentation ?? '')),
                        DataCell(Text(r.mbcSegmentation ?? '')),
                        DataCell(Text(r.requiredNotes ?? '')),
                        DataCell(Text(r.examples ?? '')),
                        DataCell(IconButton(
                          icon: const Icon(Icons.copy, size: 16),
                          onPressed: () => _copyRow(context, [
                            r.contentCategory,
                            r.shahidSegmentation ?? '',
                            r.mbcSegmentation ?? '',
                            r.requiredNotes ?? '',
                            r.examples ?? '',
                          ]),
                        )),
                      ]))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class _SpecialFileGroupTable extends StatelessWidget {
  const _SpecialFileGroupTable();

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ManualRepository>();
    return StreamBuilder<List<SegSpecialFileGroupRowData>>(
      stream: repo.watchSpecialFileGroupRows(),
      builder: (context, allSnapshot) {
        final channels = (allSnapshot.data ?? [])
            .map((r) => r.channel)
            .whereType<String>()
            .toSet()
            .toList()
          ..sort();
        return _SearchableTableScaffold(
          channelFilter: channels,
          builder: (context, search, channel) {
            var rows = allSnapshot.data ?? [];
            if (channel != null) rows = rows.where((r) => r.channel == channel).toList();
            if (search.isNotEmpty) {
              final q = search.toLowerCase();
              rows = rows.where((r) =>
                  r.fileGroup.toLowerCase().contains(q) ||
                  (r.usage?.toLowerCase().contains(q) ?? false)).toList();
            }
            if (rows.isEmpty) return const _EmptyTableState();
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('File Group')),
                  DataColumn(label: Text('Usage')),
                  DataColumn(label: Text('Channel')),
                  DataColumn(label: Text('Required Treatment')),
                  DataColumn(label: Text('Notes')),
                  DataColumn(label: Text('')),
                ],
                rows: rows
                    .map((r) => DataRow(cells: [
                          DataCell(Text(r.fileGroup)),
                          DataCell(Text(r.usage ?? '')),
                          DataCell(Text(r.channel ?? '')),
                          DataCell(Text(r.requiredTreatment ?? '')),
                          DataCell(Text(r.notes ?? '')),
                          DataCell(IconButton(
                            icon: const Icon(Icons.copy, size: 16),
                            onPressed: () => _copyRow(context, [
                              r.fileGroup,
                              r.usage ?? '',
                              r.channel ?? '',
                              r.requiredTreatment ?? '',
                              r.notes ?? '',
                            ]),
                          )),
                        ]))
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}

class _GlossaryTable extends StatelessWidget {
  const _GlossaryTable();

  @override
  Widget build(BuildContext context) {
    final repo = context.read<ManualRepository>();
    return _SearchableTableScaffold(
      builder: (context, search, _) => StreamBuilder<List<SegGlossaryRowData>>(
        stream: repo.watchGlossaryRows(),
        builder: (context, snapshot) {
          var rows = snapshot.data ?? [];
          if (search.isNotEmpty) {
            final q = search.toLowerCase();
            rows = rows.where((r) =>
                r.term.toLowerCase().contains(q) ||
                (r.meaning?.toLowerCase().contains(q) ?? false)).toList();
          }
          if (rows.isEmpty) return const _EmptyTableState();
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const [
                DataColumn(label: Text('Term')),
                DataColumn(label: Text('Meaning')),
                DataColumn(label: Text('Example')),
                DataColumn(label: Text('Related Procedure')),
                DataColumn(label: Text('')),
              ],
              rows: rows
                  .map((r) => DataRow(cells: [
                        DataCell(Text(r.term)),
                        DataCell(Text(r.meaning ?? '')),
                        DataCell(Text(r.example ?? '')),
                        DataCell(Text(r.relatedProcedure ?? '')),
                        DataCell(IconButton(
                          icon: const Icon(Icons.copy, size: 16),
                          onPressed: () => _copyRow(context, [
                            r.term,
                            r.meaning ?? '',
                            r.example ?? '',
                            r.relatedProcedure ?? '',
                          ]),
                        )),
                      ]))
                  .toList(),
            ),
          );
        },
      ),
    );
  }
}

class _EmptyTableState extends StatelessWidget {
  const _EmptyTableState();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No rows found.', style: TextStyle(color: AppColors.mutedText)),
    );
  }
}
