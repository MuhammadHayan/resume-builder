// models/work_experience.dart
class WorkExperience {
  final String title;
  final String company;
  final String period;
  final bool isCurrent;

  const WorkExperience({
    required this.title,
    required this.company,
    required this.period,
    this.isCurrent = false,
  });
}
