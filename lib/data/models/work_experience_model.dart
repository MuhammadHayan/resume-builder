import 'package:hive/hive.dart';

part 'work_experience_model.g.dart';

@HiveType(typeId: 2)
class WorkExperience extends HiveObject {
  @HiveField(0)
  String jobTitle;

  @HiveField(1)
  String companyName;

  @HiveField(2)
  String startDate;

  @HiveField(3)
  String endDate;

  @HiveField(4)
  bool isActive;

  @HiveField(5)
  String description;

  WorkExperience({
    required this.jobTitle,
    required this.companyName,
    required this.startDate,
    required this.endDate,
    this.isActive = false,
    this.description = "",
  });
}
