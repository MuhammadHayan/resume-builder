import 'package:flutter/material.dart';
import '../models/education_entry.dart';

class EducationCard extends StatelessWidget {
  final EducationEntry entry;

  const EducationCard({super.key, required this.entry});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _logo(colorScheme),
          const SizedBox(width: 16),

          Expanded(child: _content(context)),

          Column(
            children: [
              Icon(
                Icons.drag_indicator,
                color: colorScheme.onSurface.withValues(alpha: 0.4),
              ),
              const SizedBox(height: 12),
              Icon(
                Icons.edit_outlined,
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _logo(ColorScheme colorScheme) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(Icons.school, color: colorScheme.primary),
    );
  }

  Widget _content(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          entry.degree,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          entry.school,
          style: textTheme.bodyMedium?.copyWith(color: Colors.blueGrey),
        ),
        const SizedBox(height: 4),
        Text(
          entry.duration,
          style: textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
