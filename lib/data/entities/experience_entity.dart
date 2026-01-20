import 'package:isar/isar.dart';

part 'experience_entity.g.dart';

@collection
class ExperienceEntity {
  Id id = Isar.autoIncrement;

  late String title;
  late String company;
  late String period;
  late bool isCurrent;

  String? description;
}
