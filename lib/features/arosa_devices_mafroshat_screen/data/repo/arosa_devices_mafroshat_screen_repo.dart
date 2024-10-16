import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesMafroshatScreenRepo {
  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesMafrooshat) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "المرتبه ", number: "1"),
      DevicesModel(deviceName: "المخدات", number: "1",),
      DevicesModel(deviceName: "بطاطين", number: "1"),
      DevicesModel(deviceName: "لحاف", number: "1"),
      DevicesModel(deviceName: "اغطيه لحاف", number: "1"),
      DevicesModel(deviceName: "كوفرته", number: "1"),
      DevicesModel(deviceName: "مفرش سرير دفايه", number: "1"),
      DevicesModel(deviceName: "غطاء مرتبه", number: "1"),
      DevicesModel(deviceName: "طقم ملايات", number: "1"),
      DevicesModel(deviceName: "بشاكير قطن", number: "1"),
      DevicesModel(deviceName: "طقم فوط قطن", number: "1"),
      DevicesModel(deviceName: "بورنس حمام", number: "1"),
      DevicesModel(deviceName: "شبشب حمام", number: "1"),
      DevicesModel(deviceName: "مفرش سفره", number: "1"),
      DevicesModel(deviceName: "مفارش نيش", number: "1"),
      DevicesModel(deviceName: "مفارش لترابيزه", number: "1"),
      DevicesModel(deviceName: "مفارش سراير", number: "1"),
      DevicesModel(deviceName: "ملايات سرير اطفال", number: "1"),
      DevicesModel(deviceName: "كوفرته اطفال", number: "1"),
      DevicesModel(deviceName: "بطانيه اطفال", number: "1"),
      DevicesModel(deviceName: "مفارش نيش", number: "1"),
      DevicesModel(deviceName: "مفارش دواليب", number: "1"),
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesMafrooshat, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesMafrooshat) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesMafrooshat, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesMafrooshat, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesMafrooshat, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesMafrooshat, index: index, value: model);
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