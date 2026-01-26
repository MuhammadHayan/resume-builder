import 'package:hive/hive.dart';

part 'personal_details_model.g.dart';

@HiveType(typeId: 0)
class PersonalDetails extends HiveObject {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String jobTitle;

  @HiveField(2)
  String email;

  @HiveField(3)
  String phone;

  @HiveField(4)
  String location;

  @HiveField(5)
  String imagePath;

  PersonalDetails({
    required this.fullName,
    required this.jobTitle,
    required this.email,
    required this.phone,
    required this.location,
    required this.imagePath,
  });
}
