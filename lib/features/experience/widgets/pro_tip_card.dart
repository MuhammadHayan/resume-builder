// widgets/pro_tip_card.dart
import 'package:flutter/material.dart';

class ProTipCard extends StatelessWidget {
  const ProTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Icon(Icons.lightbulb_outline, color: Colors.blue),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Ensure your most recent 3 roles include at least 4 bullet points each for better ATS performance.',
            ),
          ),
        ],
      ),
    );
  }
}
