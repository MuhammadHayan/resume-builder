import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/theme/theme_provider.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/education/education_screen.dart';
import 'package:resume_builder/features/experience/experience_screen.dart';
import 'package:resume_builder/features/home/widgets/menu_card.dart';
import 'package:resume_builder/features/personal_details/personal_screen.dart';
import 'package:resume_builder/features/skills/skills_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(isMobile ? 20 : 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _welcomeHeader(context),
                  const SizedBox(height: 24),
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
  }

  // ---------------- APP BAR ----------------
  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 110,
      pinned: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
        title: Text(
          'My Resume',
          style: AppFonts.headline.copyWith(fontSize: 18),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () => context.read<ThemeProvider>().toggle(),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // ---------------- HEADER ----------------
  Widget _welcomeHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello, There 👋',
          style: AppFonts.headline.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Let’s finish your professional profile.',
          style: AppFonts.body.copyWith(color: Colors.grey),
        ),
      ],
    );
  }

  // ---------------- PROGRESS CARD ----------------
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
