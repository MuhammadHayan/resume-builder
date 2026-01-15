import 'package:flutter/material.dart';
import 'package:resume_builder/cores/constants/app_colors.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/app_text_field.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';
import 'package:resume_builder/features/experience/widgets/form_field_label.dart';

class AddWorkExperienceScreen extends StatefulWidget {
  const AddWorkExperienceScreen({super.key});

  @override
  State<AddWorkExperienceScreen> createState() =>
      _AddWorkExperienceScreenState();
}

class _AddWorkExperienceScreenState extends State<AddWorkExperienceScreen> {
  bool currentlyWorkHere = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add Experience'), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 32,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Tell us about your last role',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Include your most recent work experience first.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 32),

                  const FormFieldLabel(label: 'Company Name'),
                  const AppTextField(hint: 'e.g., Tech Solutions Inc.'),

                  const FormFieldLabel(label: 'Job Title'),
                  const AppTextField(hint: 'e.g., Senior Product Designer'),

                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            FormFieldLabel(label: 'Start Date'),
                            AppTextField(hint: 'MM/YYYY'),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            FormFieldLabel(label: 'End Date'),
                            AppTextField(hint: 'MM/YYYY'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: currentlyWorkHere,
                        activeColor: AppColors.primary,
                        onChanged: (val) =>
                            setState(() => currentlyWorkHere = val ?? false),
                      ),
                      const Text('I currently work here'),
                    ],
                  ),

                  const FormFieldLabel(label: 'Job Description'),
                  const AppTextField(
                    hint:
                        'Describe your key achievements and responsibilities...',
                    maxLines: 5,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: PrimaryButton(text: 'Save Experience', onTap: () {}),
          ),
        ],
      ),
    );
  }
}
