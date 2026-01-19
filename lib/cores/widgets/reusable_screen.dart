import 'package:flutter/material.dart';
import '../responsive/responsive.dart';
import 'appbar.dart';
import 'protip_card.dart';
import 'app_fab.dart';

class ProfileSectionScreen extends StatelessWidget {
  final String appBarTitle;
  final String sectionTitle;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final String proTipText;
  final VoidCallback onFabPressed;

  const ProfileSectionScreen({
    super.key,
    required this.appBarTitle,
    required this.sectionTitle,
    required this.itemCount,
    required this.itemBuilder,
    required this.proTipText,
    required this.onFabPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppAppBar(title: appBarTitle),
      floatingActionButton: AppFab(onPressed: onFabPressed),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          children: [
            _Header(
              title: sectionTitle,
              count: itemCount,
              colorScheme: colorScheme,
            ),
            const SizedBox(height: 20),

            Expanded(
              child: ListView.separated(
                itemCount: itemCount,
                separatorBuilder: (_, _) => const SizedBox(height: 14),
                itemBuilder: itemBuilder,
              ),
            ),

            const SizedBox(height: 16),

            ProTipCard(text: proTipText),

            const SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String title;
  final int count;
  final ColorScheme colorScheme;

  const _Header({
    required this.title,
    required this.count,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
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
