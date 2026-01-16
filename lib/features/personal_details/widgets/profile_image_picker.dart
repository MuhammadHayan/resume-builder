import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_fonts.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: colorScheme.surfaceContainerHighest,
              backgroundImage: const NetworkImage(
                'https://via.placeholder.com/150',
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {},
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: colorScheme.primary,
                  child: Icon(
                    Icons.edit_outlined,
                    size: 18,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Add a professional photo',
          style: AppFonts.headline.copyWith(
            fontSize: 18,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Square image • Minimum 400×400px',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
