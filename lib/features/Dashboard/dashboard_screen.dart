// screens/home_dashboard_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/theme/theme_provider.dart';
import 'package:resume_builder/cores/widgets/protip_card.dart';
import 'package:resume_builder/features/Dashboard/models/draft.dart';
import 'package:resume_builder/features/Dashboard/widgets/create_cv_card.dart';
import 'package:resume_builder/features/Dashboard/widgets/draft_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

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
      body: Padding(
        padding: EdgeInsets.all(isMobile ? 16 : 24),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Header(),
                const SizedBox(height: 24),
                const CreateCvCard(),
                const SizedBox(height: 28),
                const _SectionHeader(title: 'Recent Drafts'),
                const SizedBox(height: 16),
                SizedBox(
                  height: isMobile ? 240 : 280,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: drafts.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 16),
                    itemBuilder: (_, index) {
                      return DraftCard(draft: drafts[index]);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                const ProTipCard(
                  text:
                      "Users who include a “Key Achievements” section see 40% more replies to their resumes.",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends ConsumerWidget {
  // Changed to ConsumerWidget
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final themeMode = ref.watch(themeProvider);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final isDark = themeMode == ThemeMode.dark;

    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage('https://i.pravatar.cc/100'),
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back 👋', style: textTheme.bodySmall),
              Text(
                'Hayan',
                style: AppFonts.headline.copyWith(
                  fontSize: 20,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),

        IconButton.filledTonal(
          onPressed: () =>
              ref.read(themeProvider.notifier).toggle(), // Call the method
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
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
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
        TextButton(onPressed: () {}, child: const Text('View all')),
      ],
    );
  }
}
