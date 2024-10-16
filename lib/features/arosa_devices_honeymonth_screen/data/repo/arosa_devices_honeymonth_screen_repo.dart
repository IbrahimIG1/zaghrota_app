import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesHoneymonthScreenRepo {
   HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "فساتين ", number: "1"),
      DevicesModel(deviceName: "بلوزات", number: "1",),
      DevicesModel(deviceName: "بنطلونات", number: "1"),
      DevicesModel(deviceName: "اكسسوارات", number: "1"),
      DevicesModel(deviceName: "احذيه", number: "1"),
      DevicesModel(deviceName: "بيجامات", number: "1"),
      DevicesModel(deviceName: "ملابس داخليه", number: "1"),
      DevicesModel(deviceName: "لانجيري", number: "1"),
      DevicesModel(deviceName: "شنط", number: "1"),
      DevicesModel(deviceName: "احزمه", number: "1"),
      DevicesModel(deviceName: "قبعه", number: "1"),
      DevicesModel(deviceName: "فرشاه شعر", number: "1"),
      DevicesModel(deviceName: "مكياج", number: "1"),
      DevicesModel(deviceName: "طلاء اظافر", number: "1"),
      DevicesModel(deviceName: "منظف وجه", number: "1"),
      DevicesModel(deviceName: "مرطب", number: "1"),
      DevicesModel(deviceName: "واقي الشمس", number: "1"),
      DevicesModel(deviceName: "مرهم تسلخات", number: "1"),
      DevicesModel(deviceName: "ماكينه ازاله الشعر", number: "1"),
      DevicesModel(deviceName: "مزيل العرق", number: "1"),
      DevicesModel(deviceName: "فرشاه اسنان ", number: "1"),
      DevicesModel(deviceName: "مايوه سباحه", number: "1"),
      DevicesModel(deviceName: "نظاره شمس", number: "1"),
      DevicesModel(deviceName: "معقم يدين", number: "1"),
      DevicesModel(deviceName: "مسكن للالام", number: "1"),
      DevicesModel(deviceName: "اسعافات اوليه", number: "1"),
      DevicesModel(deviceName: "نسخه من عقد الزواج", number: "1"),
      DevicesModel(deviceName: "بطاقات الهويه الشخصيه", number: "1"),
      DevicesModel(deviceName: "جوازات السفر", number: "1"),
      DevicesModel(deviceName: "تذاكر السفر", number: "1"),
      DevicesModel(deviceName: "كاميرا", number: "1"),
      DevicesModel(deviceName: "شواحن", number: "1"),
      DevicesModel(deviceName: "باور بنك", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesHoneyMoon, index: index, value: model);
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