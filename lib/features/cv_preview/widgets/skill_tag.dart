// widgets/skill_tag.dart
import 'package:flutter/material.dart';

/// Reusable Expertise / Skill Tag
class SkillTag extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;

  const SkillTag({
    super.key,
    required this.label,
    this.backgroundColor = const Color(0xFFF0F4F8),
    this.textColor = const Color(0xFF546E7A),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: textColor)),
    );
  }
}
