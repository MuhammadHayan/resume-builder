import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/cv_preview/cv_preview_screen.dart';
import 'package:resume_builder/features/skills/widgets/skill_chip.dart';

class SkillsSummaryScreen extends StatefulWidget {
  const SkillsSummaryScreen({super.key});

  @override
  State<SkillsSummaryScreen> createState() => _SkillsSummaryScreenState();
}

class _SkillsSummaryScreenState extends State<SkillsSummaryScreen> {
  final List<Map<String, dynamic>> skills = [
    {'name': 'Python', 'level': 4},
    {'name': 'UI/UX Design', 'level': 3},
    {'name': 'Project Management', 'level': 5},
    {'name': 'React', 'level': 3},
  ];

  final TextEditingController skillController = TextEditingController();
  double sliderValue = 3;

  void addSkill(String value) {
    if (value.trim().isEmpty || skills.any((s) => s['name'] == value)) return;
    setState(() {
      skills.add({'name': value.trim(), 'level': sliderValue.toInt()});
      skillController.clear();
      sliderValue = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Skills'),
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(
              'Technical Skills',
              'Add skills relevant to your job and set their proficiency level.',
              colorScheme,
            ),
            const SizedBox(height: 16),
            _skillInput(colorScheme),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: skills
                  .map(
                    (skill) => SkillChipWithLevel(
                      label: skill['name'],
                      level: skill['level'],
                      onDelete: () => setState(() => skills.remove(skill)),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 80), // extra spacing for bottom button
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: PrimaryButton(
          text: 'Save Skills',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CVPreviewScreen()),
            );
          },
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------
  Widget _header(String title, String subtitle, ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 14,
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }

  // ---------------- SKILL INPUT ----------------
  Widget _skillInput(ColorScheme colorScheme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: skillController,
                  onSubmitted: addSkill,
                  style: TextStyle(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    hintText: 'Add a new skill...',
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add_circle,
                  color: colorScheme.primary,
                  size: 28,
                ),
                onPressed: () => addSkill(skillController.text),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Skill Level:',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colorScheme.onSurface,
                ),
              ),
              Expanded(
                child: Slider(
                  value: sliderValue,
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: sliderValue.round().toString(),
                  activeColor: colorScheme.primary,
                  inactiveColor: colorScheme.primary.withValues(alpha: 0.2),
                  onChanged: (val) => setState(() => sliderValue = val),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
