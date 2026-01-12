import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/widgets/app_text_field.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;

  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppFonts.body.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          AppTextField(hint: hint),
        ],
      ),
    );
  }
}
