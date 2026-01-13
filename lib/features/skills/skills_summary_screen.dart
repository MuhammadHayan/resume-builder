import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/cv_preview/cv_preview_screen.dart';

import 'widgets/pro_tip_banner.dart';
import 'widgets/skill_chip.dart';
import 'widgets/summary_editor.dart';

class SkillsSummaryScreen extends StatefulWidget {
  const SkillsSummaryScreen({super.key});

  @override
  State<SkillsSummaryScreen> createState() => _SkillsSummaryScreenState();
}

class _SkillsSummaryScreenState extends State<SkillsSummaryScreen> {
  final List<String> skills = [
    'Python',
    'UI/UX Design',
    'Project Management',
    'React',
  ];

  final TextEditingController skillController = TextEditingController();

  void addSkill(String value) {
    if (value.trim().isEmpty || skills.contains(value)) return;
    setState(() => skills.add(value.trim()));
    skillController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Skills & Summary'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 32,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(
                    'Technical Skills',
                    'Add keywords like Python, Project Management, or UI Design.',
                  ),
                  const SizedBox(height: 16),

                  _skillInput(),
                  const SizedBox(height: 16),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: skills
                        .map(
                          (skill) => SkillChip(
                            label: skill,
                            onDelete: () =>
                                setState(() => skills.remove(skill)),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 40),

                  _header(
                    'Professional Summary',
                    'Briefly describe your career goals and achievements.',
                  ),
                  const SizedBox(height: 16),

                  const SummaryEditor(),
                  const SizedBox(height: 24),

                  const ProTipBanner(
                    tip:
                        'Focus on measurable results. Use action verbs like "Increased", "Led", or "Developed".',
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(
              text: 'Save Skills',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CVPreviewScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(subtitle, style: const TextStyle(color: Colors.blueGrey)),
      ],
    );
  }

  // ---------------- SKILL INPUT ----------------
  Widget _skillInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: skillController,
              onSubmitted: addSkill,
              decoration: const InputDecoration(
                hintText: 'Type a skill and press enter',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: AppColors.primary,
              size: 28,
            ),
            onPressed: () => addSkill(skillController.text),
          ),
        ],
      ),
    );
  }
}
