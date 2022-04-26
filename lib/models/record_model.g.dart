// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordModelAdapter extends TypeAdapter<RecordModel> {
  @override
  final int typeId = 1;

  @override
  RecordModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecordModel()
      ..timeString = fields[0] as String
      ..timeInSeconds = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, RecordModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.timeString)
      ..writeByte(1)
      ..write(obj.timeInSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
