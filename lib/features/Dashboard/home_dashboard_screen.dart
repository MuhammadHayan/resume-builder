// screens/home_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:resume_builder/features/experience/widgets/pro_tip_card.dart';
import 'package:resume_builder/features/home2/models/draft.dart';
import 'package:resume_builder/features/home2/widgets/create_cv_card.dart';
import 'package:resume_builder/features/home2/widgets/draft_card.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final drafts = [
      const Draft(
        title: 'Senior Product Designer',
        subtitle: 'Edited 2h ago • San Francisco',
        imageUrl: 'https://picsum.photos/400/600',
        isNew: true,
      ),
      const Draft(
        title: 'Full Stack Developer',
        subtitle: 'Edited yesterday',
        imageUrl: 'https://picsum.photos/401/600',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0E1117),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(),
                const SizedBox(height: 24),
                const CreateCvCard(),
                const SizedBox(height: 28),
                _SectionHeader(title: 'Recent Drafts'),
                const SizedBox(height: 16),
                SizedBox(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: drafts
                        .map((draft) => DraftCard(draft: draft))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
                const ProTipCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Welcome back,', style: TextStyle(color: Colors.white54)),
              Text(
                'Alex',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(onPressed: () {}, child: const Text('View all')),
      ],
    );
  }
}
