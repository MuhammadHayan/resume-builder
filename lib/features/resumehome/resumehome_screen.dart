import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/education/education_screen.dart';
import 'package:resume_builder/features/experience/experience_screen.dart';
import 'package:resume_builder/features/personal_details/personal_details_screen.dart';
import 'package:resume_builder/features/resumehome/widgets/progress_card.dart';
import 'package:resume_builder/features/skills/skills_screen.dart';
import 'widgets/menu_card.dart';

class ResumeHomeScreen extends StatelessWidget {
  const ResumeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16 : 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressCard(),
                const SizedBox(height: 32),

                Text(
                  'Build Your Resume',
                  style: AppFonts.headline.copyWith(
                    fontSize: 20,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Complete each section to improve your chances',
                  style: theme.textTheme.bodySmall,
                ),

                const SizedBox(height: 24),
                _MenuGrid(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _BottomBar(),
    );
  }
}

class _MenuGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: isMobile ? 2 : 3,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MenuCard(
          title: 'Personal Details',
          icon: Icons.person_outline,
          onTap: () => _go(context, const PersonalScreen()),
        ),
        MenuCard(
          title: 'Education',
          icon: Icons.school_outlined,
          onTap: () => _go(context, const EducationScreen()),
        ),
        MenuCard(
          title: 'Experience',
          icon: Icons.work_outline,
          onTap: () => _go(context, const WorkHistoryScreen()),
        ),
        MenuCard(
          title: 'Skills',
          icon: Icons.psychology_outlined,
          onTap: () => _go(context, const SkillsSummaryScreen()),
        ),
        MenuCard(
          title: 'Objective',
          icon: Icons.track_changes_outlined,
          onTap: () => _go(context, const SkillsSummaryScreen()),
        ),
      ],
    );
  }

  void _go(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: PrimaryButton(text: 'Preview Resume', onTap: () {}),
    );
  }
}
