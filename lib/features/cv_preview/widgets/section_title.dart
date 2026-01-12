import 'package:flutter/material.dart';

/// Reusable Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;
  final EdgeInsetsGeometry padding;

  const SectionTitle({
    super.key,
    required this.title,
    this.fontSize = 16,
    this.color = Colors.blue,
    this.padding = const EdgeInsets.only(bottom: 12),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title.toUpperCase(), // optional uppercase style
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
