// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'badla_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BadlaModelAdapter extends TypeAdapter<BadlaModel> {
  @override
  final int typeId = 1;

  @override
  BadlaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BadlaModel(
      badlaItemName: fields[0] as String,
      checked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BadlaModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.badlaItemName)
      ..writeByte(1)
      ..write(obj.checked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BadlaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
