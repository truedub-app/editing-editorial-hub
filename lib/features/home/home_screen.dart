import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app/theme/app_colors.dart';
import '../../data/database/app_database.dart';
import '../../data/repositories/manual_repository.dart';
import '../../data/repositories/rota_repository.dart';
import '../../data/repositories/staff_repository.dart';
import '../../data/repositories/system_repository.dart';
import '../../widgets/status_pill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dayOnly = DateTime(today.year, today.month, today.day);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _Header(today: dayOnly),
          const SizedBox(height: 16),
          _CurrentUserShiftCard(date: dayOnly),
          const SizedBox(height: 16),
          _CoverageCard(date: dayOnly),
          const SizedBox(height: 16),
          _QuickActions(),
          const SizedBox(height: 16),
          _RecentlyOpenedCard(),
          const SizedBox(height: 16),
          _NoticesCard(date: dayOnly),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.today});
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good morning' : (hour < 18 ? 'Good afternoon' : 'Good evening');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(greeting, style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 4),
                  Text('Editing & Editorial Hub', style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 8, color: AppColors.qc2Green),
                    SizedBox(width: 6),
                    Text('LOCAL MODE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(DateFormat('EEEE, d MMMM yyyy').format(today),
                    style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentUserShiftCard extends StatelessWidget {
  const _CurrentUserShiftCard({required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final systemRepo = context.read<SystemRepository>();
    return StreamBuilder<String?>(
      stream: systemRepo.watchSetting('current_staff_id'),
      builder: (context, snapshot) {
        final staffId = int.tryParse(snapshot.data ?? '');
        if (staffId == null) {
          return _WhoAmICard();
        }
        return _ShiftForStaff(date: date, staffId: staffId);
      },
    );
  }
}

class _WhoAmICard extends StatelessWidget {
  const _WhoAmICard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Expanded(
              child: Text('Select who you are to see your personal shift on this device.'),
            ),
            const SizedBox(width: 12),
            FilledButton(
              onPressed: () => _pickStaff(context),
              child: const Text('Set up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickStaff(BuildContext context) async {
    final staffRepo = context.read<StaffRepository>();
    final systemRepo = context.read<SystemRepository>();
    final staff = await staffRepo.getAll(activeOnly: true);
    if (!context.mounted) return;
    final selected = await showDialog<StaffData>(
      context: context,
      builder: (context) => SimpleDialog(
        title: const Text('Who are you?'),
        children: staff
            .map((s) => SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, s),
                  child: Text(s.fullName),
                ))
            .toList(),
      ),
    );
    if (selected != null) {
      await systemRepo.setSetting('current_staff_id', selected.id.toString());
    }
  }
}

class _ShiftForStaff extends StatelessWidget {
  const _ShiftForStaff({required this.date, required this.staffId});
  final DateTime date;
  final int staffId;

  @override
  Widget build(BuildContext context) {
    final rotaRepo = context.read<RotaRepository>();
    return StreamBuilder<List<RotaWithStaff>>(
      stream: rotaRepo.watchForRange(date, date, staffId: staffId),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? [];
        if (rows.isEmpty) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('No rota has been imported for today yet for you.'),
            ),
          );
        }
        final row = rows.first;
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('TODAY', style: TextStyle(color: AppColors.mutedText, fontSize: 12)),
                const SizedBox(height: 6),
                Text('${row.assignment.section} · ${row.assignment.code}',
                    style: Theme.of(context).textTheme.titleLarge),
                if (row.assignment.hoursStart != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text('${row.assignment.hoursStart} – ${row.assignment.hoursEnd}',
                        style: const TextStyle(color: AppColors.mutedText)),
                  ),
                const SizedBox(height: 12),
                FutureBuilder<DutyAssignmentData?>(
                  future: rotaRepo.dutyFor(date, row.assignment.section),
                  builder: (context, dutySnapshot) {
                    final duty = dutySnapshot.data;
                    final isInCharge = duty?.inChargeStaffId == staffId;
                    final isQc2 = duty?.qc2StaffId == staffId || row.assignment.qc2Duty;
                    if (!isInCharge && !isQc2) return const SizedBox.shrink();
                    return Wrap(
                      spacing: 8,
                      children: [
                        if (isInCharge) const InChargeBadge(),
                        if (isQc2) const Qc2Badge(),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CoverageCard extends StatelessWidget {
  const _CoverageCard({required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final rotaRepo = context.read<RotaRepository>();
    return StreamBuilder<List<RotaWithStaff>>(
      stream: rotaRepo.watchForRange(date, date),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? [];
        if (rows.isEmpty) {
          return const Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'No rota has been imported yet.\nImport the official Excel file to begin.',
              ),
            ),
          );
        }
        final bySection = <String, List<RotaWithStaff>>{};
        for (final r in rows) {
          bySection.putIfAbsent(r.assignment.section, () => []).add(r);
        }
        const order = ['Morning', 'Afternoon', 'Night', 'Unassigned'];
        final sections = [
          ...order.where(bySection.containsKey),
          ...bySection.keys.where((s) => !order.contains(s)),
        ];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current department coverage', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 12),
                for (final section in sections)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Builder(builder: (context) {
                      final list = bySection[section]!;
                      final working = list.where((r) => r.assignment.status == 'Working').length;
                      final absent = list.length - working;
                      return Row(
                        children: [
                          SizedBox(width: 100, child: Text(section)),
                          Text('$working working', style: const TextStyle(color: AppColors.qc2Green)),
                          const Text(' · '),
                          Text('$absent absent', style: const TextStyle(color: AppColors.mutedText)),
                        ],
                      );
                    }),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final actions = [
      (Icons.calendar_month_outlined, "Today's rota", '/rota'),
      (Icons.menu_book_outlined, 'Open Work Manual', '/manual'),
      (Icons.contacts_outlined, 'Search contacts', '/contacts'),
      (Icons.upload_file_outlined, 'Import new rota', '/settings/import-rota'),
      (Icons.block_outlined, 'View blacklist', '/blacklist'),
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: actions
          .map((a) => OutlinedButton.icon(
                onPressed: () => context.go(a.$3),
                icon: Icon(a.$1, size: 18),
                label: Text(a.$2),
              ))
          .toList(),
    );
  }
}

class _RecentlyOpenedCard extends StatelessWidget {
  const _RecentlyOpenedCard();

  @override
  Widget build(BuildContext context) {
    final manualRepo = context.read<ManualRepository>();
    return StreamBuilder<List<ManualDocumentData>>(
      stream: manualRepo.watchRecentlyOpened(),
      builder: (context, snapshot) {
        final docs = snapshot.data ?? [];
        if (docs.isEmpty) return const SizedBox.shrink();
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recently opened', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                for (final d in docs)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(d.title),
                    leading: const Icon(Icons.description_outlined, color: AppColors.mutedText),
                    onTap: () => context.go('/manual/document/${d.id}'),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _NoticesCard extends StatelessWidget {
  const _NoticesCard({required this.date});
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final systemRepo = context.read<SystemRepository>();
    return StreamBuilder<String?>(
      stream: systemRepo.watchSetting('last_import_at'),
      builder: (context, snapshot) {
        final lastImport = snapshot.data;
        if (lastImport == null) return const SizedBox.shrink();
        final dt = DateTime.tryParse(lastImport);
        final label = dt == null ? lastImport : DateFormat('d MMM yyyy, HH:mm').format(dt);
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.primaryBlue, size: 20),
                const SizedBox(width: 10),
                Expanded(child: Text('Rota last imported: $label')),
              ],
            ),
          ),
        );
      },
    );
  }
}
