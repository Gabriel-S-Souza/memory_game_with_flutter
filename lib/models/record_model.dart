import 'package:hive/hive.dart';

part 'record_model.g.dart';

@HiveType(typeId: 1)
class RecordModel {
  @HiveField(0)
  late String timeString;
  @HiveField(1)
  late int timeInSeconds;
}