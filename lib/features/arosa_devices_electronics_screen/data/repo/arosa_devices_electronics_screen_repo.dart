import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesElectronicsScreenRepo {
   HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesElectronics) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "ثلاجه  ", number: "1"),
      DevicesModel(deviceName: "بوتجاز", number: "1",),
      DevicesModel(deviceName: "غساله ملابس", number: "1"),
      DevicesModel(deviceName: "سخان (غاز او كهرباء)", number: "1"),
      DevicesModel(deviceName: "مروحه", number: "1"),
      DevicesModel(deviceName: "مكيفات", number: "1"),
      DevicesModel(deviceName: "شاشه تليفزيون", number: "1"),
      DevicesModel(deviceName: "شفاط مطبخ", number: "1"),
      DevicesModel(deviceName: "فرن كهرباء", number: "1"),
      DevicesModel(deviceName: "مايكروويف", number: "1"),
      DevicesModel(deviceName: "غساله اطباق", number: "1"),
      DevicesModel(deviceName: "ديب فريزر", number: "1"),
      DevicesModel(deviceName: "مجفف ملابس", number: "1"),
      DevicesModel(deviceName: "مبرد مياه", number: "1"),
      DevicesModel(deviceName: "غساله اطفال", number: "1"),
      DevicesModel(deviceName: "مكواه بخار", number: "1"),
      DevicesModel(deviceName: "كشاف نور", number: "1"),
      DevicesModel(deviceName: "صاعق ناموس", number: "1"),
      DevicesModel(deviceName: "شفاط حمام", number: "1"),
      DevicesModel(deviceName: "خلاط", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesElectronics, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesElectronics) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesElectronics, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesElectronics, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesElectronics, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesElectronics, index: index, value: model);
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