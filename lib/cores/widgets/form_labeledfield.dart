import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';
import 'package:resume_builder/cores/widgets/app_textfield.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final int maxLines;

  const LabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppFonts.body.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          AppTextField(hint: hint, prefixIcon: icon, maxLines: maxLines),
        ],
      ),
    );
  }
}
