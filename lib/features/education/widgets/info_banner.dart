import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';

class InfoBanner extends StatelessWidget {
  final String message;

  const InfoBanner({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.lightbulb, color: AppColors.primary),
          const SizedBox(width: 12),
          Expanded(child: Text(message, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}
