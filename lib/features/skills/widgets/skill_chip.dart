import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';

class SkillChipWithLevel extends StatelessWidget {
  final String label;
  final int level;
  final VoidCallback onDelete;

  const SkillChipWithLevel({
    super.key,
    required this.label,
    required this.level,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Row(
            children: List.generate(
              5,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 1),
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: index < level
                      ? AppColors.primary
                      : AppColors.primary.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
              ),
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
