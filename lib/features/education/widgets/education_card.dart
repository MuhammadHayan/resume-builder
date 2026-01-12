import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import '../models/education_entry.dart';

class EducationCard extends StatelessWidget {
  final EducationEntry entry;

  const EducationCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _logo(),
          const SizedBox(width: 16),

          Expanded(child: _content()),

          const Icon(Icons.reorder, color: Colors.grey),
          const SizedBox(width: 12),
          const Icon(Icons.edit, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _logo() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.school, color: AppColors.primary),
    );
  }

  Widget _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry.degree,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 4),
        Text(entry.school, style: const TextStyle(color: Colors.blueGrey)),
        const SizedBox(height: 4),
        Text(
          entry.duration,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
