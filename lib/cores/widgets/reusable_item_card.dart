import 'package:flutter/material.dart';

class ProfileItemCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String meta;
  final VoidCallback? onEdit;
  final bool draggable;

  const ProfileItemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.meta,
    this.onEdit,
    this.draggable = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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
          _Icon(icon: icon),
          const SizedBox(width: 16),

          /// Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  meta,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
          ),

          /// Actions
          Column(
            children: [
              if (draggable)
                Icon(
                  Icons.drag_indicator,
                  color: colorScheme.onSurface.withValues(alpha: 0.4),
                ),
              const SizedBox(height: 12),
              InkWell(
                onTap: onEdit,
                child: Icon(
                  Icons.edit_outlined,
                  color: colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Icon extends StatelessWidget {
  final IconData icon;

  const _Icon({required this.icon});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: colorScheme.primary),
    );
  }
}
