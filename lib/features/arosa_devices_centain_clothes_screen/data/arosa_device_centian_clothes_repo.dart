import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDeviceCentianClothesRepo {
  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesCentianClothes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "برا  قماش  ", number: "1"),
      DevicesModel(deviceName: "برا قطن", number: "1",),
      DevicesModel(deviceName: "برا مبطن", number: "1"),
      DevicesModel(deviceName: "برا غير مبطن", number: "1"),
      DevicesModel(deviceName: "بانتي ساده", number: "1"),
      DevicesModel(deviceName: "بانتي دانتيل", number: "1"),
      DevicesModel(deviceName: "بانتي قطن", number: "1"),
      DevicesModel(deviceName: "بانتي قصير", number: "1"),
      DevicesModel(deviceName: "بانتي طويل", number: "1"),
      DevicesModel(deviceName: "برا بدون حمالات", number: "1"),
      DevicesModel(deviceName: "برا رياضي", number: "1"),
      DevicesModel(deviceName: "برا سيليكون", number: "1"),
      DevicesModel(deviceName: "بانتي عالي الخصر", number: "1"),
      DevicesModel(deviceName: "بانتي لانجيري", number: "1"),
      DevicesModel(deviceName: "قميص لانجيري", number: "1"),
      DevicesModel(deviceName: "قميص شيفون", number: "1"),
      DevicesModel(deviceName: "قميص ساتان", number: "1"),
      DevicesModel(deviceName: "فستان بيت قصير", number: "1"),
      DevicesModel(deviceName: "فستان بيت طويل", number: "1"),
      DevicesModel(deviceName: "فستان بيت باكمام", number: "1"),
      DevicesModel(deviceName: "فستان بيت بدون اكمام", number: "1"),
      DevicesModel(deviceName: "شورتات قطنيه", number: "1"),
      DevicesModel(deviceName: "شورتات رياضيه", number: "1"),
      DevicesModel(deviceName: "شورتات للبيت", number: "1"),
      DevicesModel(deviceName: "تيشرتات", number: "1"),
      DevicesModel(deviceName: "بلوزات قطنيه ", number: "1"),
      DevicesModel(deviceName: "بلوزات حريريه", number: "1"),
      DevicesModel(deviceName: "بلوزات بدون اكمام", number: "1"),
      DevicesModel(deviceName: "بلوزات باكمام قصيره", number: "1"),
      DevicesModel(deviceName: "بلوزات طويله", number: "1"),
      DevicesModel(deviceName: "شورتات حريريه", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesCentianClothes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesCentianClothes) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesCentianClothes, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesCentianClothes, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesCentianClothes, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesCentianClothes, index: index, value: model);
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