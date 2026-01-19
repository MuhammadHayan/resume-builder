import 'package:flutter/material.dart';
import 'package:resume_builder/cores/widgets/reusable_item_card.dart';
import 'package:resume_builder/cores/widgets/reusable_screen.dart';
import 'package:resume_builder/features/experience/add_experience.dart';
import 'package:resume_builder/features/experience/models/work_experience.dart';

class WorkHistoryScreen extends StatelessWidget {
  const WorkHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      const WorkExperience(
        title: 'Senior Product Designer',
        company: 'TechCorp',
        period: 'Jan 2021 – Present',
        isCurrent: true,
      ),
      const WorkExperience(
        title: 'UI Designer',
        company: 'Creative Studio',
        period: 'Jun 2018 – Dec 2020',
      ),
      const WorkExperience(
        title: 'Junior Designer',
        company: 'Design Hub',
        period: 'May 2016 – May 2018',
      ),
    ];

    return ProfileSectionScreen(
      appBarTitle: 'Work History',
      sectionTitle: 'Your Experience',
      itemCount: experiences.length,
      proTipText:
          'Highlight achievements with measurable impact. Recruiters focus on results.',
      itemBuilder: (context, index) {
        final experience = experiences[index];

        return ProfileItemCard(
          icon: Icons.work_outline,
          title: experience.title,
          subtitle: experience.company,
          meta: experience.period,
          onEdit: () {
            // Navigate to edit experience
          },
        );
      },
      onFabPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddWorkExperienceScreen()),
        );
      },
    );
  }
}
