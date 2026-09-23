import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/repositories/rota_repository.dart';
import '../../data/repositories/system_repository.dart';
import 'widgets/rota_day_view.dart';
import 'widgets/rota_month_view.dart';
import 'widgets/rota_week_view.dart';

enum _ViewMode { day, week, month }

class RotaScreen extends StatefulWidget {
  const RotaScreen({super.key});

  @override
  State<RotaScreen> createState() => _RotaScreenState();
}

class _RotaScreenState extends State<RotaScreen> {
  _ViewMode _mode = _ViewMode.day;
  DateTime _anchor = DateTime.now();
  String? _sectionFilter;
  bool _myScheduleOnly = false;

  DateTime get _dayOnly => DateTime(_anchor.year, _anchor.month, _anchor.day);

  DateTime get _weekStart {
    final d = _dayOnly;
    return d.subtract(Duration(days: d.weekday % 7));
  }

  void _shift(int amount) {
    setState(() {
      switch (_mode) {
        case _ViewMode.day:
          _anchor = _anchor.add(Duration(days: amount));
        case _ViewMode.week:
          _anchor = _anchor.add(Duration(days: 7 * amount));
        case _ViewMode.month:
          _anchor = DateTime(_anchor.year, _anchor.month + amount, 1);
      }
    });
  }

  String get _titleLabel {
    switch (_mode) {
      case _ViewMode.day:
        return DateFormat('EEEE, d MMMM yyyy').format(_dayOnly);
      case _ViewMode.week:
        final end = _weekStart.add(const Duration(days: 6));
        return '${DateFormat('d MMM').format(_weekStart)} – ${DateFormat('d MMM yyyy').format(end)}';
      case _ViewMode.month:
        return DateFormat('MMMM yyyy').format(_anchor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shift ROTA'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: FutureBuilder<List<String>>(
              future: context.read<RotaRepository>().distinctSections(),
              builder: (context, snapshot) {
                final sections = snapshot.data ?? [];
                return DropdownButton<String?>(
                  value: _sectionFilter,
                  hint: const Text('All sections'),
                  underline: const SizedBox.shrink(),
                  items: [
                    const DropdownMenuItem<String?>(value: null, child: Text('All sections')),
                    ...sections.map((s) => DropdownMenuItem<String?>(value: s, child: Text(s))),
                  ],
                  onChanged: (v) => setState(() => _sectionFilter = v),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildToolbar(context),
          const Divider(height: 1, color: AppColors.divider),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12,
        runSpacing: 8,
        children: [
          SegmentedButton<_ViewMode>(
            segments: const [
              ButtonSegment(value: _ViewMode.day, label: Text('Day')),
              ButtonSegment(value: _ViewMode.week, label: Text('Week')),
              ButtonSegment(value: _ViewMode.month, label: Text('Month')),
            ],
            selected: {_mode},
            onSelectionChanged: (s) => setState(() => _mode = s.first),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () => _shift(-1), icon: const Icon(Icons.chevron_left)),
              TextButton(
                onPressed: () => setState(() => _anchor = DateTime.now()),
                child: const Text('Today'),
              ),
              IconButton(onPressed: () => _shift(1), icon: const Icon(Icons.chevron_right)),
            ],
          ),
          Text(_titleLabel, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          FutureBuilder<String?>(
            future: context.read<SystemRepository>().getSetting('current_staff_id'),
            builder: (context, snapshot) {
              final hasProfile = snapshot.data != null;
              if (!hasProfile) return const SizedBox.shrink();
              return SegmentedButton<bool>(
                segments: const [
                  ButtonSegment(value: true, label: Text('My Schedule')),
                  ButtonSegment(value: false, label: Text('Full Team')),
                ],
                selected: {_myScheduleOnly},
                onSelectionChanged: (s) => setState(() => _myScheduleOnly = s.first),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder<String?>(
      future: context.read<SystemRepository>().getSetting('current_staff_id'),
      builder: (context, snapshot) {
        final staffId = _myScheduleOnly ? int.tryParse(snapshot.data ?? '') : null;
        switch (_mode) {
          case _ViewMode.day:
            return RotaDayView(date: _dayOnly, sectionFilter: _sectionFilter, staffId: staffId);
          case _ViewMode.week:
            return RotaWeekView(weekStart: _weekStart, sectionFilter: _sectionFilter, staffId: staffId);
          case _ViewMode.month:
            return RotaMonthView(month: _anchor, sectionFilter: _sectionFilter, staffId: staffId);
        }
      },
    );
  }
}
