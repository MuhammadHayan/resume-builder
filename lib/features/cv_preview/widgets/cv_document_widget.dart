import 'package:flutter/material.dart';
import 'package:resume_builder/features/cv_preview/widgets/experience_entry.dart';
import 'package:resume_builder/features/cv_preview/widgets/section_title.dart';
import 'package:resume_builder/features/cv_preview/widgets/skill_tag.dart';

class CVDocumentWidget extends StatelessWidget {
  const CVDocumentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alex Rivera',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      'Senior UX Designer',
                      style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          _contactInfo(Icons.email, 'alex.rivera@example.com'),
          _contactInfo(Icons.phone, '+1 (555) 0123-4567'),
          _contactInfo(Icons.location_on, 'San Francisco, CA'),

          const Divider(height: 40),

          const SectionTitle(title: 'PROFESSIONAL SUMMARY'),
          const Text(
            'Innovative UX Designer with 8+ years of experience in creating user-centric digital products...',
            style: TextStyle(height: 1.5, color: Colors.black87),
          ),

          const Divider(height: 40),

          const SectionTitle(title: 'EXPERIENCE'),
          const ExperienceEntry(
            title: 'Lead Product Designer',
            company: 'TechCorp Solutions',
            period: '2020 — Present',
            bullets: [
              'Led the redesign of the flagship mobile application.',
              'Mentored a team of 5 junior designers.',
            ],
          ),

          const SectionTitle(title: 'EXPERTISE'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: const [
              'Product Design',
              'UI/UX Strategy',
              'Figma',
              'React.js',
            ].map((s) => SkillTag(label: s)).toList(),
          ),

          const Divider(height: 40),

          const SectionTitle(title: 'EDUCATION'),
          const Text(
            'B.S. in Interaction Design',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const Text(
            'University of Arts & Design, Portland',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _contactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.blueGrey)),
        ],
      ),
    );
  }
}
