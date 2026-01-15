// widgets/pro_tip_card.dart
import 'package:flutter/material.dart';

class ProTipCard extends StatelessWidget {
  const ProTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F26),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: const [
          Icon(Icons.lightbulb_outline, color: Colors.blue),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Users who include a “Key Achievements” section see 40% more replies to their resumes.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
