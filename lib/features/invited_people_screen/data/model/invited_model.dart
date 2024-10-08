import 'package:hive_flutter/hive_flutter.dart';
part 'invited_model.g.dart';
@HiveType(typeId: 0)
class InvitedModel {
  @HiveField(0)
   String name;
  @HiveField(1)
  bool checked;
  @HiveField(2)
  int numberOfInvitedPeople;

   InvitedModel({required this.name,required this.numberOfInvitedPeople,this.checked=false});
}