import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';

/// Small colored label for a rota status/code. Never relies on color alone
/// — every pill carries its own text.
class StatusPill extends StatelessWidget {
  const StatusPill({super.key, required this.status, this.code});

  final String status;
  final String? code;

  Color get _color {
    switch (status) {
      case 'Working':
        return AppColors.primaryBlue;
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

  @override
  Widget build(BuildContext context) {
    final label = code != null && status == 'Working' ? code! : status;
    final color = _color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
    );
  }
}

class InChargeBadge extends StatelessWidget {
  const InChargeBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Badge(icon: Icons.star, label: 'IN CHARGE', color: AppColors.inChargeYellow);
  }
}

class Qc2Badge extends StatelessWidget {
  const Qc2Badge({super.key});

  @override
  Widget build(BuildContext context) {
    return const _Badge(icon: Icons.check_circle, label: 'QC 2', color: AppColors.qc2Green);
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.icon, required this.label, required this.color});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 4),
          Text(label, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
