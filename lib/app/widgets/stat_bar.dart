import 'package:flutter/material.dart';
import 'package:shadow_monarch/app/theme/app_theme.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final int maxValue;

  const StatBar({
    Key? key,
    required this.label,
    required this.value,
    required this.maxValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$value/$maxValue',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: value / maxValue,
            backgroundColor: Colors.grey[800],
            valueColor: const AlwaysStoppedAnimation<Color>(AppTheme.shadowPurple),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
