import 'package:hive_flutter/hive_flutter.dart';
part 'devices_model.g.dart';

@HiveType(typeId: 3)
class DevicesModel {
  @HiveField(0)
  String deviceName;
  @HiveField(1)
  bool checked;
  @HiveField(2)
  String number;
  DevicesModel({required this.deviceName,required this.number, this.checked=false});
}