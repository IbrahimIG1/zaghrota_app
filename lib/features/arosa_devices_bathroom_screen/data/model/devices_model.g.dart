// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'devices_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DevicesModelAdapter extends TypeAdapter<DevicesModel> {
  @override
  final int typeId = 3;

  @override
  DevicesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DevicesModel(
      deviceName: fields[0] as String,
      number: fields[2] as String,
      checked: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DevicesModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.deviceName)
      ..writeByte(1)
      ..write(obj.checked)
      ..writeByte(2)
      ..write(obj.number);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DevicesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
