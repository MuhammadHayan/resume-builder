import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/app_fab.dart';
import 'package:resume_builder/cores/widgets/pro_tip_card.dart';
import 'package:resume_builder/features/education/add_education.dart';
import 'package:resume_builder/features/education/models/education_entry.dart';
import 'package:resume_builder/features/education/widgets/education_card.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    final List<EducationEntry> degrees = [
      EducationEntry(
        degree: 'Master of Business Administration',
        school: 'Harvard Business School',
        duration: '2023 - Present',
        logoUrl: '',
      ),
      EducationEntry(
        degree: 'B.S. in Computer Science',
        school: 'Stanford University',
        duration: '2018 - 2022',
        logoUrl: '',
      ),
      EducationEntry(
        degree: 'High School Diploma',
        school: 'Ridgewood High School',
        duration: '2014 - 2018',
        logoUrl: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Education'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          children: [
            _header(context, degrees.length),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: degrees.length,
                separatorBuilder: (_, _) => const SizedBox(height: 14),
                itemBuilder: (_, index) {
                  return EducationCard(entry: degrees[index]);
                },
              ),
            ),

            const SizedBox(height: 16),

            const ProTipCard(
              text:
                  'Add your most recent degree first. Recruiters usually scan education top-down.',
            ),

            const SizedBox(height: 90),
          ],
        ),
      ),
      floatingActionButton: AppFab(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEducationScreen()),
          );
        },
      ),
    );
  }

  Widget _header(BuildContext context, int count) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Your Education',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count entries',
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
