import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesR2sClothesScreenRepo {
   HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesR2sClothes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "بدله رقص شرقي خفيفه  ", number: "1"),
      DevicesModel(deviceName: "بدله رقص شرقي شيفون", number: "1",),
      DevicesModel(deviceName: "بدله رقص دانتيل شفافه", number: "1"),
      DevicesModel(deviceName: "بدله رقص دانتيل مثيره", number: "1"),
      DevicesModel(deviceName: "بدله رقص حرير", number: "1"),
      DevicesModel(deviceName: "بدله رقص بترتر", number: "1"),
      DevicesModel(deviceName: "اطقم رقص", number: "1"),
      DevicesModel(deviceName: "ملابس رقص شرقي بسيطه", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesR2sClothes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesR2sClothes) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesR2sClothes, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesR2sClothes, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesR2sClothes, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesR2sClothes, index: index, value: model);
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