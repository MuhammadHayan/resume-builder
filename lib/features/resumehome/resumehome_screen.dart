import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/education/education_screen.dart';
import 'package:resume_builder/features/experience/experience_screen.dart';
import 'package:resume_builder/features/resumehome/widgets/menu_card.dart';
import 'package:resume_builder/features/personal_details/personal_screen.dart';
import 'package:resume_builder/features/skills/skills_screen.dart';

class ResumeHomeScreen extends StatelessWidget {
  const ResumeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _progressCard(context),
                  const SizedBox(height: 32),
                  Text(
                    'Resume Sections',
                    style: AppFonts.headline.copyWith(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  _menuList(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomBar(context),
    );
  } // ---------------- PROGRESS CARD ----------------

  Widget _progressCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary, AppColors.primary.withValues(alpha: 0.8)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Overall Progress', style: TextStyle(color: Colors.white)),
              Text(
                '60%',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const LinearProgressIndicator(
            value: 0.6,
            backgroundColor: Colors.white24,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        ],
      ),
    );
  }

  // ---------------- MENU List ----------------
  Widget _menuList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        MenuCard(
          title: 'Personal Details',
          icon: Icons.badge_outlined,
          onTap: () => _go(context, const PersonalScreen()),
        ),
        const SizedBox(height: 16),

        MenuCard(
          title: 'Education',
          icon: Icons.school_outlined,
          onTap: () => _go(context, const EducationScreen()),
        ),
        const SizedBox(height: 16),

        MenuCard(
          title: 'Experience',
          icon: Icons.work_outline,
          onTap: () => _go(context, const WorkHistoryScreen()),
        ),
        const SizedBox(height: 16),

        MenuCard(
          title: 'Skills',
          icon: Icons.psychology_outlined,
          onTap: () => _go(context, const SkillsSummaryScreen()),
        ),
        const SizedBox(height: 16),

        MenuCard(
          title: 'Objective',
          icon: Icons.psychology_outlined,
          onTap: () => _go(context, const SkillsSummaryScreen()),
        ),
      ],
    );
  }

  // ---------------- BOTTOM BAR ----------------
  Widget _bottomBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: PrimaryButton(text: 'Preview Full CV', onTap: () {}),
    );
  }

  void _go(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
}
