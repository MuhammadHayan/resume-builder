import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/resume_builder.dart';
import 'cores/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const ResumeBuilder(),
    ),
  );
}
