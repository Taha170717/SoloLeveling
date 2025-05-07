import 'package:flutter/material.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';

class AbilityChip extends StatelessWidget {
  final String label;

  const AbilityChip({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppTheme.shadowPurple.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.grey[300],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
