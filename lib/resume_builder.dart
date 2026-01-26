import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/cores/theme/app_theme.dart';
import 'package:resume_builder/cores/theme/theme_provider.dart';
import 'package:resume_builder/features/Dashboard/dashboard_screen.dart';

class ResumeBuilder extends ConsumerWidget {
  // Changed to ConsumerWidget
  const ResumeBuilder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Added WidgetRef
    final themeMode = ref.watch(themeProvider); // Watch the state directly

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const DashboardScreen(),
    );
  }
}
