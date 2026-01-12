import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.primary,
                child: const Icon(Icons.edit, size: 18, color: Colors.white),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Add a professional photo',
          style: AppFonts.headline.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 4),
        Text(
          'Recommended: Square image, 400×400px',
          style: AppFonts.body.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
