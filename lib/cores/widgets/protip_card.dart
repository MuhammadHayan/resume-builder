// widgets/pro_tip_card.dart
import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';

class ProTipCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const ProTipCard({
    super.key,
    required this.text,
    this.icon = Icons.lightbulb_outline,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 18),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: isMobile ? 22 : 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppFonts.body.copyWith(
                fontSize: 14,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
