import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/cores/theme/app_theme.dart';
import 'package:resume_builder/cores/theme/theme_provider.dart';
import 'package:resume_builder/features/Dashboard/dashboard_screen.dart';

class ResumeBuilder extends StatelessWidget {
  const ResumeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeProvider.mode,
      home: const DashboardScreen(),
    );
  }
}
