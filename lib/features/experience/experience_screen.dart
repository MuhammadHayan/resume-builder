// screens/work_history_screen.dart
import 'package:flutter/material.dart';
import 'package:resume_builder/features/experience/add_experience.dart';
import 'package:resume_builder/features/experience/models/work_experience.dart';
import 'package:resume_builder/cores/widgets/pro_tip_card.dart';
import 'package:resume_builder/features/experience/widgets/work_experience_card.dart';

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

    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      appBar: AppBar(
        title: const Text('Work History'),
        actions: [TextButton(onPressed: () {}, child: const Text('Edit'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('TIMELINE', style: Theme.of(context).textTheme.labelSmall),
            const SizedBox(height: 4),
            Text(
              'Your professional journey at a glance.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  for (final exp in experiences)
                    WorkExperienceCard(experience: exp),
                  const SizedBox(height: 8),
                  const ProTipCard(
                    text:
                        "Ensure your most recent 3 roles include at least 4 bullet points each for better ATS performance.",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddWorkExperienceScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Experience'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
