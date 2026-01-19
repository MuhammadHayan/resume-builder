import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/appbar.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';

class ObjectiveScreen extends StatelessWidget {
  const ObjectiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppAppBar(title: 'Objective'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 16 : 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),

            /// Header
            Text(
              'Career Objective',
              style: AppFonts.headline.copyWith(color: colorScheme.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              'Write a short summary highlighting your experience, skills, and career goals.',
              style: AppFonts.body.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),

            const SizedBox(height: 24),

            /// Objective Input Card
            _ObjectiveInputCard(isDark: isDark),

            const Spacer(),

            /// Continue Button
            PrimaryButton(text: 'Save', onTap: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _ObjectiveInputCard extends StatelessWidget {
  final bool isDark;

  const _ObjectiveInputCard({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.edit_note_rounded, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'Your Objective',
                style: AppFonts.body.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          TextField(
            maxLines: 6,
            style: AppFonts.body.copyWith(color: colorScheme.onSurface),
            decoration: InputDecoration(
              hintText:
                  'Example:\nSenior Product Designer with 6+ years of experience designing user-centered digital products. Passionate about solving complex problems and building intuitive experiences.',
              hintStyle: AppFonts.body.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.5),
              ),
              filled: true,
              fillColor: isDark
                  ? Colors.white.withValues(alpha: 0.03)
                  : Colors.grey.shade100,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
          ),

          const SizedBox(height: 12),

          /// Tip
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.lightbulb_outline, size: 18, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Keep it under 3–4 lines. Focus on achievements and value, not responsibilities.',
                  style: AppFonts.body.copyWith(
                    fontSize: 14,
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
