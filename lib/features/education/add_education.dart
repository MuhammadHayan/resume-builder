// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:resume_builder/cores/responsive/responsive.dart';
import 'package:resume_builder/cores/widgets/form_labeled_field.dart';
import 'package:resume_builder/cores/widgets/primary_button.dart';

class AddEducationScreen extends StatefulWidget {
  const AddEducationScreen({super.key});

  @override
  State<AddEducationScreen> createState() => _AddEducationScreenState();
}

class _AddEducationScreenState extends State<AddEducationScreen> {
  bool _currentlyStudying = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Education'), centerTitle: true),
      body: SafeArea(
        child: Column(
          children: [
            /// Scrollable Form
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 32,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LabeledField(
                      label: 'School / University',
                      hint: 'e.g. Harvard University',
                      icon: Icons.school_outlined,
                    ),

                    const LabeledField(
                      label: 'Course / Degree',
                      hint: 'e.g. Bachelor of Science',
                      icon: Icons.menu_book_outlined,
                    ),

                    const LabeledField(
                      label: 'Grade / Score',
                      hint: 'e.g. 3.7 GPA',
                      icon: Icons.grade_outlined,
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
                          value: _currentlyStudying,
                          activeColor: colorScheme.primary,
                          onChanged: (val) {
                            setState(() {
                              _currentlyStudying = val ?? false;
                            });
                          },
                        ),
                        Text(
                          'I am currently studying here',
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),

                    const LabeledField(
                      label: 'Description (Optional)',
                      hint:
                          'Relevant coursework, honors, or academic activities',
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
                text: 'Save Education',
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
