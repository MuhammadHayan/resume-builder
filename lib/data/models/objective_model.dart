import 'package:hive/hive.dart';

part 'objective_model.g.dart';

@HiveType(typeId: 4)
class CareerObjective extends HiveObject {
  @HiveField(0)
  String objective;

  CareerObjective({required this.objective});
}
