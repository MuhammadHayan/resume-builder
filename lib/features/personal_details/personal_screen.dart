import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/personal_details/widgets/labeled_field.dart';
import 'widgets/profile_image_picker.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Personal Details'), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 32,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //_progressBar(),
            const SizedBox(height: 32),

            const Center(child: ProfileImagePicker()),
            const SizedBox(height: 32),

            const LabeledField(label: 'Full Name', hint: 'Jane Doe'),
            const LabeledField(
              label: 'Professional Title',
              hint: 'Senior Product Designer',
            ),
            const LabeledField(
              label: 'Email Address',
              hint: 'jane.doe@design.com',
            ),
            const LabeledField(
              label: 'Phone Number',
              hint: '+1 (555) 892-4412',
            ),
            const LabeledField(
              label: 'Address',
              hint: 'San Francisco, CA',
              icon: Icons.location_on,
            ),

            const SizedBox(height: 32),

            PrimaryButton(text: 'Save Details', onTap: () {}),
          ],
        ),
      ),
    );
  }
}
