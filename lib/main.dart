import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/features/Dashboard/dashboard_screen.dart';
import 'cores/theme/theme_provider.dart';
import 'cores/theme/app_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ResumeBuilderApp(),
    ),
  );
}

class ResumeBuilderApp extends StatelessWidget {
  const ResumeBuilderApp({super.key});

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
