import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/appbar.dart';
import 'package:resume_builder/cores/widgets/form_labeledfield.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'widgets/profile_image_picker.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const AppAppBar(title: 'Personal Details'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 28,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Profile section
            const Center(child: ProfileImagePicker()),
            const SizedBox(height: 40),

            /// Form card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: colorScheme.outline.withValues(alpha: 0.3),
                ),
              ),
              child: const Column(
                children: [
                  LabeledField(
                    label: 'Full Name',
                    hint: 'Jane Doe',
                    icon: Icons.person_outline,
                  ),
                  LabeledField(
                    label: 'Professional Title',
                    hint: 'Senior Product Designer',
                    icon: Icons.badge_outlined,
                  ),
                  LabeledField(
                    label: 'Email Address',
                    hint: 'jane.doe@design.com',
                    icon: Icons.email_outlined,
                  ),
                  LabeledField(
                    label: 'Phone Number',
                    hint: '+1 (555) 892-4412',
                    icon: Icons.phone_outlined,
                  ),
                  LabeledField(
                    label: 'Location',
                    hint: 'San Francisco, CA',
                    icon: Icons.location_on_outlined,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            PrimaryButton(text: 'Save Details', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
