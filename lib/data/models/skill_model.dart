import 'package:hive/hive.dart';

part 'skill_model.g.dart';

@HiveType(typeId: 3)
class Skill extends HiveObject {
  @HiveField(0)
  String skillName;

  @HiveField(1)
  String level;

  Skill({required this.skillName, required this.level});
}
