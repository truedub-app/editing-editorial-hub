import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../data/repositories/rota_repository.dart';
import '../../../widgets/status_pill.dart';

const _sectionOrder = ['Morning', 'Afternoon', 'Night', 'Unassigned'];
const _nameColWidth = 180.0;
const _cellWidth = 92.0;
const _rowHeight = 44.0;

class RotaWeekView extends StatefulWidget {
  const RotaWeekView({super.key, required this.weekStart, this.sectionFilter, this.staffId});

  final DateTime weekStart;
  final String? sectionFilter;
  final int? staffId;

  @override
  State<RotaWeekView> createState() => _RotaWeekViewState();
}

class _RotaWeekViewState extends State<RotaWeekView> {
  final _hController = ScrollController();

  @override
  void dispose() {
    _hController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final days = List.generate(7, (i) => widget.weekStart.add(Duration(days: i)));
    final rotaRepo = context.read<RotaRepository>();

    return StreamBuilder<List<RotaWithStaff>>(
      stream: rotaRepo.watchForRange(days.first, days.last, staffId: widget.staffId),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? [];
        if (rows.isEmpty) {
          return const Center(
            child: Text('No rota data for this week.', style: TextStyle(color: AppColors.mutedText)),
          );
        }

        final bySection = <String, Map<int, Map<String, RotaWithStaff>>>{};
        final staffNames = <int, String>{};
        for (final r in rows) {
          if (widget.sectionFilter != null && r.assignment.section != widget.sectionFilter) continue;
          final dateKey = DateFormat('yyyy-MM-dd').format(r.assignment.date);
          bySection.putIfAbsent(r.assignment.section, () => {});
          bySection[r.assignment.section]!.putIfAbsent(r.staff.id, () => {});
          bySection[r.assignment.section]![r.staff.id]![dateKey] = r;
          staffNames[r.staff.id] = r.staff.fullName;
        }
        final sections = [
          ..._sectionOrder.where(bySection.containsKey),
          ...bySection.keys.where((s) => !_sectionOrder.contains(s)),
        ];

        return Column(
          children: [
            _HeaderRow(days: days, hController: _hController),
            const Divider(height: 1, color: AppColors.divider),
            Expanded(
              child: ListView(
                children: [
                  for (final section in sections) ...[
                    _SectionHeaderRow(label: section),
                    ..._sortedStaffIds(bySection[section]!, staffNames).map((staffId) => _StaffRow(
                          name: staffNames[staffId]!,
                          days: days,
                          cells: bySection[section]![staffId]!,
                          hController: _hController,
                        )),
                    _HeadcountRow(days: days, sectionData: bySection[section]!, hController: _hController),
                  ],
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<int> _sortedStaffIds(Map<int, Map<String, RotaWithStaff>> data, Map<int, String> names) {
    final ids = data.keys.toList();
    ids.sort((a, b) => (names[a] ?? '').compareTo(names[b] ?? ''));
    return ids;
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow({required this.days, required this.hController});
  final List<DateTime> days;
  final ScrollController hController;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          const SizedBox(
            width: _nameColWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Staff', style: TextStyle(color: AppColors.mutedText, fontWeight: FontWeight.w600)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: hController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: days
                    .map((d) => Container(
                          width: _cellWidth,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _isSameDay(d, today) ? AppColors.primaryBlue.withValues(alpha: 0.12) : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(DateFormat('EEE').format(d), style: const TextStyle(fontSize: 11)),
                              Text(DateFormat('d MMM').format(d),
                                  style: const TextStyle(fontSize: 11, color: AppColors.mutedText)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;
}

class _SectionHeaderRow extends StatelessWidget {
  const _SectionHeaderRow({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      color: AppColors.cardElevated,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(label.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0.5)),
    );
  }
}

class _StaffRow extends StatelessWidget {
  const _StaffRow({required this.name, required this.days, required this.cells, required this.hController});
  final String name;
  final List<DateTime> days;
  final Map<String, RotaWithStaff> cells;
  final ScrollController hController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _rowHeight,
      child: Row(
        children: [
          SizedBox(
            width: _nameColWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: hController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: days.map((d) {
                  final key = DateFormat('yyyy-MM-dd').format(d);
                  final cell = cells[key];
                  return SizedBox(
                    width: _cellWidth,
                    child: Center(
                      child: cell == null
                          ? const Text('–', style: TextStyle(color: AppColors.mutedText))
                          : StatusPill(status: cell.assignment.status, code: cell.assignment.code),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadcountRow extends StatelessWidget {
  const _HeadcountRow({required this.days, required this.sectionData, required this.hController});
  final List<DateTime> days;
  final Map<int, Map<String, RotaWithStaff>> sectionData;
  final ScrollController hController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          const SizedBox(
            width: _nameColWidth,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Headcount', style: TextStyle(fontSize: 12, color: AppColors.mutedText)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: hController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              child: Row(
                children: days.map((d) {
                  final key = DateFormat('yyyy-MM-dd').format(d);
                  final count = sectionData.values
                      .where((byDate) => byDate[key]?.assignment.status == 'Working')
                      .length;
                  return SizedBox(
                    width: _cellWidth,
                    child: Center(
                      child: Text('$count', style: const TextStyle(fontSize: 12, color: AppColors.mutedText)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
