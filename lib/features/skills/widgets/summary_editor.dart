import 'package:flutter/material.dart';

class SummaryEditor extends StatelessWidget {
  const SummaryEditor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: const [
                Icon(Icons.format_bold, color: Colors.blueGrey),
                SizedBox(width: 16),
                Icon(Icons.format_italic, color: Colors.blueGrey),
                SizedBox(width: 16),
                Icon(Icons.format_list_bulleted, color: Colors.blueGrey),
              ],
            ),
          ),
          const Divider(height: 1),
          const TextField(
            maxLines: 8,
            decoration: InputDecoration(
              hintText: 'Dedicated professional with 5+ years of experience...',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                '0 / 500 CHARACTERS',
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
