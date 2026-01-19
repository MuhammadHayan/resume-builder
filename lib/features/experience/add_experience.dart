// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/appbar.dart';
import 'package:resume_builder/cores/widgets/form_labeledfield.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';

class AddWorkExperienceScreen extends StatefulWidget {
  const AddWorkExperienceScreen({super.key});

  @override
  State<AddWorkExperienceScreen> createState() =>
      _AddWorkExperienceScreenState();
}

class _AddWorkExperienceScreenState extends State<AddWorkExperienceScreen> {
  bool _currentlyWorking = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: const AppAppBar(title: 'Add Experience'),
      body: SafeArea(
        child: Column(
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
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Include your most recent work experience first.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 32),
                    const LabeledField(
                      label: 'Company Name',
                      hint: 'e.g. TechCorp',
                      icon: Icons.business_outlined,
                    ),

                    const LabeledField(
                      label: 'Job Title',
                      hint: 'e.g. Senior Product Designer',
                      icon: Icons.work_outline,
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: const [
                        Expanded(
                          child: LabeledField(
                            label: 'Start Date',
                            hint: 'MM / YYYY',
                            icon: Icons.calendar_today_outlined,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: LabeledField(
                            label: 'End Date',
                            hint: 'MM / YYYY',
                            icon: Icons.event_outlined,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 4),

                    Row(
                      children: [
                        Checkbox(
                          value: _currentlyWorking,
                          activeColor: colorScheme.primary,
                          onChanged: (val) {
                            setState(() {
                              _currentlyWorking = val ?? false;
                            });
                          },
                        ),
                        Text(
                          'I currently work here',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),

                    const LabeledField(
                      label: 'Description (Optional)',
                      hint: 'Key achievements, responsibilities, and impact',
                      icon: Icons.notes_outlined,
                      maxLines: 4,
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            /// Bottom Save Button
            Container(
              padding: EdgeInsets.fromLTRB(
                isMobile ? 20 : 32,
                16,
                isMobile ? 20 : 32,
                24,
              ),
              child: PrimaryButton(
                text: 'Save Experience',
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
