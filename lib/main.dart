import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/cores/theme/app_theme.dart';
import 'package:resume_builder/cores/theme/theme_provider.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ResumeApp(),
    ),
  );
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: theme.mode,
      home: const HomeScreen(),
    );
  }
}
