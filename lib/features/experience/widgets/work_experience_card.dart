// widgets/work_experience_card.dart
import 'package:flutter/material.dart';
import '../models/work_experience.dart';

class WorkExperienceCard extends StatelessWidget {
  final WorkExperience experience;

  const WorkExperienceCard({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CompanyAvatar(company: experience.company),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  experience.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  experience.company,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined, size: 16),
                    const SizedBox(width: 6),
                    Text(experience.period, style: theme.textTheme.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Icon(Icons.edit_outlined, size: 20),
              const SizedBox(height: 8),
              Icon(Icons.delete_outline, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}

class _CompanyAvatar extends StatelessWidget {
  final String company;

  const _CompanyAvatar({required this.company});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        company.characters.first,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
