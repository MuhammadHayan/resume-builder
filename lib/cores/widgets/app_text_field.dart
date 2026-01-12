import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final int maxLines;

  const AppTextField({super.key, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
