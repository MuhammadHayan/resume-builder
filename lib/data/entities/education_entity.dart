import 'package:isar/isar.dart';

part 'education_entity.g.dart';

@collection
class EducationEntity {
  Id id = Isar.autoIncrement;

  late String degree;
  late String school;
  late String duration;

  String? description;
}
