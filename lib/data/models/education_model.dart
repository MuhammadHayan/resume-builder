import 'package:hive/hive.dart';

part 'education_model.g.dart';

@HiveType(typeId: 1)
class Education extends HiveObject {
  @HiveField(0)
  String degree;

  @HiveField(1)
  String schoolName;

  @HiveField(2)
  String startDate;

  @HiveField(3)
  String endDate;

  @HiveField(4)
  bool isActive;

  @HiveField(5)
  String description;

  Education({
    required this.degree,
    required this.schoolName,
    required this.startDate,
    required this.endDate,
    this.isActive = false,
    this.description = "",
  });
}
