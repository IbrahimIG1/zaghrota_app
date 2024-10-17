import 'package:hive_flutter/hive_flutter.dart';
part 'farah_model.g.dart';
@HiveType(typeId: 4)
class FarahModel {
  @HiveField(0)
  String aresName;
  @HiveField(1)
  String arosaName;
  @HiveField(2)
  DateTime farahTime;

  FarahModel({required this.aresName,required this.arosaName,required this.farahTime});
}