import 'package:flutter/material.dart';

import '../app/theme/app_colors.dart';

class InitialsAvatar extends StatelessWidget {
  const InitialsAvatar({super.key, required this.initials, this.size = 36, this.highlight = false});

  final String initials;
  final double size;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: highlight ? AppColors.primaryBlue : AppColors.cardElevated,
      child: Text(
        initials,
        style: TextStyle(
          fontSize: size * 0.36,
          fontWeight: FontWeight.w600,
          color: AppColors.text,
        ),
      ),
    );
  }
}
