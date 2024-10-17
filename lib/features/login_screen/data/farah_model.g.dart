// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farah_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FarahModelAdapter extends TypeAdapter<FarahModel> {
  @override
  final int typeId = 4;

  @override
  FarahModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FarahModel(
      aresName: fields[0] as String,
      arosaName: fields[1] as String,
      farahTime: fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FarahModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.aresName)
      ..writeByte(1)
      ..write(obj.arosaName)
      ..writeByte(2)
      ..write(obj.farahTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FarahModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
