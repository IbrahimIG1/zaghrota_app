import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesUnfformalClothesScreenRepo {
   HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "جينز سكيني", number: "1"),
      DevicesModel(deviceName: "جينز بوى فريند", number: "1",),
      DevicesModel(deviceName: "جينز مريح", number: "1"),
      DevicesModel(deviceName: "بناطيل كاجول قماش ", number: "1"),
      DevicesModel(deviceName: "بناطيل كاجول ليجنز", number: "1"),
      DevicesModel(deviceName: "بلوزه قطن باكمام قصيره", number: "1"),
      DevicesModel(deviceName: "بلوزه قطن باكمام طويله", number: "1"),
      DevicesModel(deviceName: "تيشرتات قطن ملونه", number: "1"),
      DevicesModel(deviceName: "تيشرتات قطن ساده", number: "1"),
      DevicesModel(deviceName: "تيشرتات قطن برسومات", number: "1"),
      DevicesModel(deviceName: "شورت جينز قصير", number: "1"),
      DevicesModel(deviceName: "شورت جينز متوسط", number: "1"),
      DevicesModel(deviceName: "شورت قماش كاجول للخروج", number: "1"),
      DevicesModel(deviceName: "جاكيت خفيف دينيم", number: "1"),
      DevicesModel(deviceName: "جاكيت خفيف قماش", number: "1"),
      DevicesModel(deviceName: "قميص طويل", number: "1"),
      DevicesModel(deviceName: "بناطيل ليجنز جلد", number: "1"),
      DevicesModel(deviceName: "بناطيل ليجنز قطن", number: "1"),
      DevicesModel(deviceName: "بناطيل واسعه قماش", number: "1"),
      DevicesModel(deviceName: "بناطيل واسعه كتان", number: "1"),
      DevicesModel(deviceName: "تيشرتات بالوان متعدده", number: "1"),
   
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes) as List<DevicesModel>;
      
    
    return right(data);
    

    }
    else{
     

      return right(data);
    }
  }
  on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Future<Either<ErrorModel,void>> addData({required DevicesModel model})async{
    try{
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes, value: model);
      return right(null);
    }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Future<Either<ErrorModel,void>> updateCheck({required int index,required DevicesModel model})async{
    try{
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes, index: index, value: model);
  return right(null);
    }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Either<ErrorModel,void> deleteItem({required int index}){
    try{
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes, index: index);
      return right(null);
    }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

   Future<Either<ErrorModel,void>> updateNumber({required String index,required DevicesModel model})async{
    try{
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesUnFormalClothes, index: index, value: model);
  return right(null);
    }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }
}