import 'package:hive_flutter/hive_flutter.dart';
part 'badla_model.g.dart';
@HiveType(typeId: 1)
class BadlaModel {
  @HiveField(0)
   String badlaItemName;
   @HiveField(1)
  bool checked;
  BadlaModel({required this.badlaItemName,this.checked=false});
}