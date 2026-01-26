import 'package:flutter/material.dart';
import 'package:resume_builder/cores/widgets/reusable_item_card.dart';
import 'package:resume_builder/cores/widgets/reusable_screen.dart';
import 'package:resume_builder/features/education/add_education.dart';
import 'package:resume_builder/features/education/models/education_entry.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final degrees = [
      const EducationEntry(
        degree: 'Master of Business Administration',
        school: 'Harvard Business School',
        duration: '2023 - Present',
        logoUrl: '',
      ),
      const EducationEntry(
        degree: 'B.S. in Computer Science',
        school: 'Stanford University',
        duration: '2018 - 2022',
        logoUrl: '',
      ),
      const EducationEntry(
        degree: 'High School Diploma',
        school: 'Ridgewood High School',
        duration: '2014 - 2018',
        logoUrl: '',
      ),
    ];

    return ProfileSectionScreen(
      appBarTitle: 'Education',
      sectionTitle: 'Your Education',
      itemCount: degrees.length,
      proTipText:
          'Add your most recent degree first. Recruiters usually scan education top-down.',
      itemBuilder: (context, index) {
        final entry = degrees[index];

        return ProfileItemCard(
          icon: Icons.school,
          title: entry.degree,
          subtitle: entry.school,
          meta: entry.duration,
          onEdit: () {
            // Navigate to edit education
          },
        );
      },
      onFabPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddEducationScreen()),
        );
      },
    );
  }
}
