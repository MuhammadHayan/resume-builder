import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final VoidCallback onDelete;

  const SkillChip({super.key, required this.label, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: const Icon(Icons.cancel, size: 18, color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
