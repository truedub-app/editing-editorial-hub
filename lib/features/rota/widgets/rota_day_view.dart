import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/theme/app_colors.dart';
import '../../../data/database/app_database.dart';
import '../../../data/repositories/rota_repository.dart';
import '../../../services/duty_validation_service.dart';
import '../../../widgets/initials_avatar.dart';
import '../../../widgets/status_pill.dart';

const _sectionOrder = ['Morning', 'Afternoon', 'Night', 'Unassigned'];
const _sectionHours = {
  'Morning': '08:00 – 16:00',
  'Afternoon': '16:00 – 00:00',
  'Night': '00:00 – 08:00',
  'Unassigned': '',
};

class RotaDayView extends StatelessWidget {
  const RotaDayView({super.key, required this.date, this.sectionFilter, this.staffId});

  final DateTime date;
  final String? sectionFilter;
  final int? staffId;

  @override
  Widget build(BuildContext context) {
    final rotaRepo = context.read<RotaRepository>();
    return StreamBuilder<List<RotaWithStaff>>(
      stream: rotaRepo.watchForRange(date, date, staffId: staffId),
      builder: (context, snapshot) {
        final rows = snapshot.data ?? [];
        if (rows.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'No rota has been imported yet.\nImport the official Excel file to begin.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.mutedText),
              ),
            ),
          );
        }
        final bySection = <String, List<RotaWithStaff>>{};
        for (final r in rows) {
          if (sectionFilter != null && r.assignment.section != sectionFilter) continue;
          bySection.putIfAbsent(r.assignment.section, () => []).add(r);
        }
        final sections = [
          ..._sectionOrder.where(bySection.containsKey),
          ...bySection.keys.where((s) => !_sectionOrder.contains(s)),
        ];
        return StreamBuilder<List<DutyAssignmentData>>(
          stream: rotaRepo.watchDutyForDate(date),
          builder: (context, dutySnapshot) {
            final duties = {for (final d in dutySnapshot.data ?? <DutyAssignmentData>[]) d.section: d};
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                for (final section in sections) ...[
                  _SectionBlock(
                    date: date,
                    section: section,
                    rows: bySection[section]!..sort((a, b) => a.staff.fullName.compareTo(b.staff.fullName)),
                    duty: duties[section],
                  ),
                  const SizedBox(height: 20),
                ],
              ],
            );
          },
        );
      },
    );
  }
}

class _SectionBlock extends StatelessWidget {
  const _SectionBlock({required this.date, required this.section, required this.rows, this.duty});

  final DateTime date;
  final String section;
  final List<RotaWithStaff> rows;
  final DutyAssignmentData? duty;

  @override
  Widget build(BuildContext context) {
    final working = rows.where((r) => r.assignment.status == 'Working').toList();
    final validation = DutyValidationService().validate(
      rosteredWorking: working.map((r) => r.staff).toList(),
      inChargeStaffId: duty?.inChargeStaffId,
      qc2StaffId: duty?.qc2StaffId,
      sectionLabel: section,
    );

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(section.toUpperCase(),
                    style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5)),
                const SizedBox(width: 10),
                if (_sectionHours[section]?.isNotEmpty ?? false)
                  Text(_sectionHours[section]!, style: const TextStyle(color: AppColors.mutedText)),
                const Spacer(),
                Text('${rows.length} staff', style: const TextStyle(color: AppColors.mutedText)),
              ],
            ),
            const SizedBox(height: 12),
            _DutyRow(
              date: date,
              section: section,
              working: working.map((r) => r.staff).toList(),
              duty: duty,
            ),
            if (!validation.isValid)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: validation.errors
                      .map((e) => Text('⚠ $e', style: const TextStyle(color: AppColors.errorRed, fontSize: 12)))
                      .toList(),
                ),
              )
            else if (!validation.isComplete)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('⚠ $section band requires both an in-charge and a QC 2 duty holder.',
                    style: const TextStyle(color: AppColors.warningOrange, fontSize: 12)),
              ),
            const Divider(height: 24),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: rows.map((r) => _ShiftCard(row: r, duty: duty)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _DutyRow extends StatelessWidget {
  const _DutyRow({required this.date, required this.section, required this.working, this.duty});

  final DateTime date;
  final String section;
  final List<StaffData> working;
  final DutyAssignmentData? duty;

  @override
  Widget build(BuildContext context) {
    final rotaRepo = context.read<RotaRepository>();
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: [
        _DutyDropdown(
          label: 'In Charge',
          icon: Icons.star,
          color: AppColors.inChargeYellow,
          options: working,
          value: duty?.inChargeStaffId,
          onChanged: (id) => rotaRepo.upsertDuty(
            date: date,
            section: section,
            inChargeStaffId: id,
            qc2StaffId: duty?.qc2StaffId,
          ),
        ),
        _DutyDropdown(
          label: 'QC 2 Duty',
          icon: Icons.check_circle,
          color: AppColors.qc2Green,
          options: working,
          value: duty?.qc2StaffId,
          onChanged: (id) => rotaRepo.upsertDuty(
            date: date,
            section: section,
            inChargeStaffId: duty?.inChargeStaffId,
            qc2StaffId: id,
          ),
        ),
      ],
    );
  }
}

class _DutyDropdown extends StatelessWidget {
  const _DutyDropdown({
    required this.label,
    required this.icon,
    required this.color,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final IconData icon;
  final Color color;
  final List<StaffData> options;
  final int? value;
  final ValueChanged<int?> onChanged;

  @override
  Widget build(BuildContext context) {
    final valid = value == null || options.any((o) => o.id == value);
    return SizedBox(
      width: 240,
      child: DropdownButtonFormField<int?>(
        initialValue: valid ? value : null,
        isExpanded: true,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: color, size: 18),
          isDense: true,
        ),
        items: [
          const DropdownMenuItem<int?>(value: null, child: Text('— Not set —')),
          ...options.map((s) => DropdownMenuItem<int?>(
                value: s.id,
                child: Text(s.fullName, overflow: TextOverflow.ellipsis),
              )),
        ],
        onChanged: onChanged,
      ),
    );
  }
}

class _ShiftCard extends StatelessWidget {
  const _ShiftCard({required this.row, this.duty});
  final RotaWithStaff row;
  final DutyAssignmentData? duty;

  @override
  Widget build(BuildContext context) {
    final isInCharge = duty?.inChargeStaffId == row.staff.id;
    final isQc2 = duty?.qc2StaffId == row.staff.id;
    return SizedBox(
      width: 220,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.cardElevated,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InitialsAvatar(initials: row.staff.initials),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(row.staff.fullName,
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            StatusPill(status: row.assignment.status, code: row.assignment.code),
            if (row.assignment.hoursStart != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text('${row.assignment.hoursStart} – ${row.assignment.hoursEnd}',
                    style: const TextStyle(color: AppColors.mutedText, fontSize: 12)),
              ),
            if (isInCharge || isQc2)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Wrap(
                  spacing: 6,
                  children: [
                    if (isInCharge) const InChargeBadge(),
                    if (isQc2) const Qc2Badge(),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
