import 'package:hive_flutter/hive_flutter.dart';
import '../models/personal_details_model.dart';
import '../models/skill_model.dart';
import '../models/objective_model.dart';
import '../models/education_model.dart';
import '../models/work_experience_model.dart';

class HiveService {
  static const _personalBox = 'personal_box';
  static const _skillsBox = 'skills_box';
  static const _objectiveBox = 'objective_box';
  static const _educationBox = 'education_box';
  static const _workBox = 'work_box';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(PersonalDetailsAdapter());
    Hive.registerAdapter(SkillAdapter());
    Hive.registerAdapter(CareerObjectiveAdapter());
    Hive.registerAdapter(EducationAdapter());
    Hive.registerAdapter(WorkExperienceAdapter());

    await Hive.openBox<PersonalDetails>(_personalBox);
    await Hive.openBox<Skill>(_skillsBox);
    await Hive.openBox<CareerObjective>(_objectiveBox);
    await Hive.openBox<Education>(_educationBox);
    await Hive.openBox<WorkExperience>(_workBox);
  }

  // PERSONAL
  static Box<PersonalDetails> get personalBox =>
      Hive.box<PersonalDetails>(_personalBox);

  // SKILLS
  static Box<Skill> get skillsBox => Hive.box<Skill>(_skillsBox);

  // OBJECTIVE
  static Box<CareerObjective> get objectiveBox =>
      Hive.box<CareerObjective>(_objectiveBox);

  // EDUCATION
  static Box<Education> get educationBox => Hive.box<Education>(_educationBox);

  // WORK
  static Box<WorkExperience> get workBox => Hive.box<WorkExperience>(_workBox);
}
