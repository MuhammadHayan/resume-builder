import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/features/education/add_education.dart';
import 'package:resume_builder/features/education/models/education_entry.dart';
import 'package:resume_builder/features/education/widgets/education_card.dart';
import 'package:resume_builder/features/education/widgets/info_banner.dart';

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
      appBar: AppBar(title: const Text('Education'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          children: [
            _header(degrees.length),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.separated(
                itemCount: degrees.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  return EducationCard(entry: degrees[index]);
                },
              ),
            ),

            const InfoBanner(
              message:
                  'Add your most recent degree first. Employers usually look for your highest education level.',
            ),
            const SizedBox(height: 90),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddEducationScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }

  Widget _header(int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Degrees',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          '$count ENTRIES',
          style: const TextStyle(
            color: Colors.grey,
            letterSpacing: 1.2,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
