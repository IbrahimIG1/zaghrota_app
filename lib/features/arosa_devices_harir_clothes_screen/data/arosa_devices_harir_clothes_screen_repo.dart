import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesHarirClothesScreenRepo {
  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesHarirClothes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [
      DevicesModel(deviceName: "فساتين دانتيل", number: "1",),
      DevicesModel(deviceName: "ملابس النوم", number: "1"),
      DevicesModel(deviceName: "قمصان نوم دانتيل قصيره", number: "1"),
      DevicesModel(deviceName: "قمصان نوم دانتيل طويله", number: "1"),
      DevicesModel(deviceName: "قمصان نوم دانتيل بفتحه ظهر", number: "1"),
      DevicesModel(deviceName: "روب نوم حرير", number: "1"),
      DevicesModel(deviceName: "روب نوم ساتان", number: "1"),
      DevicesModel(deviceName: "روب نوم دانتيل", number: "1"),
      DevicesModel(deviceName: "بيجامه نوم قطن", number: "1"),
      DevicesModel(deviceName: "بيجامه نوم حرير", number: "1"),
      DevicesModel(deviceName: "بيجامه نوم صيفيه", number: "1"),
      DevicesModel(deviceName: "بيجامه نوم شتويه", number: "1"),
      DevicesModel(deviceName: "بيجامات حرير", number: "1"),
      DevicesModel(deviceName: "قميص نوم بدون اكمام اساتان", number: "1"),
      DevicesModel(deviceName: "قميص نوم بدون اكمام حرير", number: "1"),
      DevicesModel(deviceName: "برا للنوم", number: "1"),
      DevicesModel(deviceName: "ملابس الشتاء", number: "1"),
      DevicesModel(deviceName: "بيجامه شتويه فانيلا", number: "1"),
      DevicesModel(deviceName: "بيجامه شتويه صوف", number: "1"),
      DevicesModel(deviceName: "بناطيل طويله", number: "1"),
      DevicesModel(deviceName: "جاكيت شتوي خفيف صوف", number: "1"),
      DevicesModel(deviceName: "جاكيت شتوي خفيف قطن", number: "1"),
      DevicesModel(deviceName: "معاطف", number: "1"),
      DevicesModel(deviceName: "جوارب ثقيل قطن", number: "1"),
      DevicesModel(deviceName: "جوارب ثقيله صوف", number: "1"),
      DevicesModel(deviceName: "ملابس حريريه للنوم", number: "1"),
      DevicesModel(deviceName: "شال او وشاح", number: "1"),
      DevicesModel(deviceName: "قفازات شتويه صوف", number: "1"),
      DevicesModel(deviceName: "قفازات شتويه جلد", number: "1"),
      DevicesModel(deviceName: "سويت شيرت قطن", number: "1"),
      DevicesModel(deviceName: "سويت شيرت صوف", number: "1"),
      DevicesModel(deviceName: "كارديجان خفيف ", number: "1"),
      DevicesModel(deviceName: "كارديجان ثقيل", number: "1"),
      DevicesModel(deviceName: "لينجز شتوي قطن", number: "1"),
      DevicesModel(deviceName: "لينجز حراري", number: "1"),
      DevicesModel(deviceName: "حذاء منزلي شتوي", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesHarirClothes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesHarirClothes) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesHarirClothes, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesHarirClothes, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesHarirClothes, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesHarirClothes, index: index, value: model);
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