// widgets/experience_entry.dart
import 'package:flutter/material.dart';

/// Reusable Experience Layout Widget
class ExperienceEntry extends StatelessWidget {
  final String title; // Job title
  final String company; // Company name
  final String period; // Duration (e.g., 2020 — Present)
  final List<String> bullets; // Key achievements or responsibilities

  const ExperienceEntry({
    super.key,
    required this.title,
    required this.company,
    required this.period,
    required this.bullets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and period
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              Text(
                period,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          // Company name
          Text(
            company,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          // Bullet points
          ...bullets.map(
            (bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '• ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      bullet,
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
