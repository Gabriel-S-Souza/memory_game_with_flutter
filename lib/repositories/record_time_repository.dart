import 'package:hive_flutter/hive_flutter.dart';
import 'package:memory_game/models/record_model.dart';

class RecordTimeRepository {
  static Box<RecordModel> getRecordTime() {
    return Hive.box<RecordModel>('record');
  }
}