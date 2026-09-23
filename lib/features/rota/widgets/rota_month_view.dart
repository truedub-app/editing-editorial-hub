import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../data/repositories/rota_repository.dart';

const _sectionOrder = ['Morning', 'Afternoon', 'Night', 'Unassigned'];
const _nameColWidth = 180.0;
const _cellWidth = 34.0;
const _rowHeight = 30.0;

Color _codeColor(String status) {
  switch (status) {
    case 'Working':
      return AppColors.text;
    case 'OFF':
      return AppColors.mutedText;
    case 'HOL':
      return AppColors.warningOrange;
    case 'TOIL':
      return AppColors.warningOrange;
    case 'SICK':
      return AppColors.errorRed;
    default:
      return AppColors.mutedText;
  }
}

class RotaMonthView extends StatefulWidget {
  const RotaMonthView({super.key, required this.month, this.sectionFilter, this.staffId});

  final DateTime month;
  final String? sectionFilter;
  final int? staffId;

  @override
  State<RotaMonthView> createState() => _RotaMonthViewState();
}

class _RotaMonthViewState extends State<RotaMonthView> {
  final _hController = ScrollController();
  String _search = '';

  @override
  void dispose() {
    _hController.dispose();
    super.dispose();
  }

  void _jumpToToday(List<DateTime> days) {
    final today = DateTime.now();
    final index = days.indexWhere((d) => d.year == today.year && d.month == today.month && d.day == today.day);
    if (index == -1) return;
    _hController.animateTo(
      (index * _cellWidth).clamp(0, _hController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final firstDay = DateTime(widget.month.year, widget.month.month, 1);
    final daysInMonth = DateTime(widget.month.year, widget.month.month + 1, 0).day;
    final days = List.generate(daysInMonth, (i) => firstDay.add(Duration(days: i)));
    final rotaRepo = context.read<RotaRepository>();

    return StreamBuilder<List<RotaWithStaff>>(
      stream: rotaRepo.watchForRange(days.first, days.last, staffId: widget.staffId),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? [];
        if (rows.isEmpty) {
          return const Center(
            child: Text('No rota data for this month.', style: TextStyle(color: AppColors.mutedText)),
          );
        }
        final bySection = <String, Map<int, Map<String, RotaWithStaff>>>{};
        final staffNames = <int, String>{};
        for (final r in rows) {
          if (widget.sectionFilter != null && r.assignment.section != widget.sectionFilter) continue;
          if (_search.isNotEmpty && !r.staff.fullName.toLowerCase().contains(_search.toLowerCase())) continue;
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
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, size: 20),
                        hintText: 'Search staff member',
                        isDense: true,
                      ),
                      onChanged: (v) => setState(() => _search = v),
                    ),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton.icon(
                    onPressed: () => _jumpToToday(days),
                    icon: const Icon(Icons.today, size: 16),
                    label: const Text('Today'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _HeaderRow(days: days, hController: _hController),
            const Divider(height: 1, color: AppColors.divider),
            Expanded(
              child: ListView(
                children: [
                  for (final section in sections) ...[
                    Container(
                      height: 28,
                      color: AppColors.cardElevated,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(section.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0.5)),
                    ),
                    ..._sortedStaffIds(bySection[section]!, staffNames).map((staffId) => _StaffRow(
                          name: staffNames[staffId]!,
                          days: days,
                          cells: bySection[section]![staffId]!,
                          hController: _hController,
                        )),
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
      height: 34,
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
                          child: Text('${d.day}', style: const TextStyle(fontSize: 11)),
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
              child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13)),
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
                          ? const Text('–', style: TextStyle(color: AppColors.mutedText, fontSize: 12))
                          : Text(
                              cell.assignment.status == 'Working' ? cell.assignment.code : cell.assignment.status[0],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: _codeColor(cell.assignment.status),
                              ),
                            ),
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
