import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesSportsClothesScreenRepo {
  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesSportsClothes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "اطقم رياضه تراكسوت", number: "1"),
      DevicesModel(deviceName: "بنطلونات رياضيه", number: "1",),
      DevicesModel(deviceName: "تيشرتات رياضيه", number: "1"),
      DevicesModel(deviceName: "تيشرتات رياضيه قطنيه قصيره", number: "1"),
      DevicesModel(deviceName: "تيشرتات رياضيه قطنيه طويله", number: "1"),
      DevicesModel(deviceName: "بناطيل رياضيه ليجنز", number: "1"),
      DevicesModel(deviceName: "بناطيل رياضيه فضفاضه", number: "1"),
      DevicesModel(deviceName: "احذيه رياضيه للمشي", number: "1"),
      DevicesModel(deviceName: "احذيه رياضيه للجري", number: "1"),
      DevicesModel(deviceName: "احذيه رياضيه للتمارين", number: "1"),
      DevicesModel(deviceName: "شورتات رياضه قطن", number: "1"),
      DevicesModel(deviceName: "شورتات رياضه ليكرا", number: "1"),
      DevicesModel(deviceName: "برا رياضي", number: "1"),
      DevicesModel(deviceName: "تيشرتات فضفاضه", number: "1"),
      DevicesModel(deviceName: "جاكيت رياضي", number: "1"),
      DevicesModel(deviceName: "ملابس رياضه الشتاء", number: "1"),
      DevicesModel(deviceName: "ملابس السباحه والشاطئ", number: "1"),
      DevicesModel(deviceName: "مايوه قطعه واحده", number: "1"),
      DevicesModel(deviceName: "مايوه بيكيني", number: "1"),
      DevicesModel(deviceName: "كاش مايوه", number: "1"),
      DevicesModel(deviceName: "قبعه شمسيه", number: "1"),
      DevicesModel(deviceName: "نظارات شمسيه", number: "1"),
      DevicesModel(deviceName: "شورت سباحه قصير ", number: "1"),
      DevicesModel(deviceName: "شورت سباحه طويل", number: "1"),
      DevicesModel(deviceName: "صنادل للشاطئ", number: "1"),
      DevicesModel(deviceName: "حقيبه شاطئيه", number: "1"),
      DevicesModel(deviceName: "فوطه شاطئيه", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesSportsClothes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesSportsClothes) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesSportsClothes, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesSportsClothes, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesSportsClothes, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesSportsClothes, index: index, value: model);
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