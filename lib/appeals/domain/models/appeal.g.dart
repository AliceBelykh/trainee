// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appeal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppealAdapter extends TypeAdapter<Appeal> {
  @override
  final int typeId = 1;

  @override
  Appeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Appeal(
      fields[0] as int,
      fields[1] as String,
      fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Appeal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.appealNumber)
      ..writeByte(1)
      ..write(obj.appealStatus)
      ..writeByte(3)
      ..write(obj.appealDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
