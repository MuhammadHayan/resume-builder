// widgets/create_cv_card.dart
import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/features/resumehome/resumehome_screen.dart';

class CreateCvCard extends StatelessWidget {
  const CreateCvCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ResumeHomeScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              colorScheme.primary,
              colorScheme.primary.withValues(alpha: 0.75),
            ],
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New CV',
                    style: AppFonts.body.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Start from a professional template',
                    style: AppFonts.body.copyWith(
                      fontSize: 14,
                      color: colorScheme.onPrimary.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: isMobile ? 36 : 40,
              height: isMobile ? 36 : 40,
              decoration: BoxDecoration(
                color: colorScheme.onPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: colorScheme.primary,
                size: isMobile ? 20 : 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
