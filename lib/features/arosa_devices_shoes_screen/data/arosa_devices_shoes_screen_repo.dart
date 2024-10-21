import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesShoesScreenRepo {
    HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesShoes) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "شبشب منزلي قطن ", number: "1"),
      DevicesModel(deviceName: "شبشب منزلي بلاستيك", number: "1",),
      DevicesModel(deviceName: "شبشب منزلي مفتوح", number: "1"),
      DevicesModel(deviceName: "شبشب منزلي مغلق ", number: "1"),
      DevicesModel(deviceName: "حذاء كعب عالي ساده", number: "1"),
      DevicesModel(deviceName: "حذاء كعب عالي مطرز", number: "1"),
      DevicesModel(deviceName: "صندل بكعب", number: "1"),
      DevicesModel(deviceName: "صندل مفتوح", number: "1"),
      DevicesModel(deviceName: "احذيه مسطحه باليرينا", number: "1"),
      DevicesModel(deviceName: "احذيه مسطحه لوفر", number: "1"),
      DevicesModel(deviceName: "بوت طويل", number: "1"),
      DevicesModel(deviceName: "بوت قصير ", number: "1"),
      DevicesModel(deviceName: "بوت جلد", number: "1"),
      DevicesModel(deviceName: "شبشب شاطئ", number: "1"),
      DevicesModel(deviceName: "احذيه مريحه للخروج الكاجول", number: "1"),
      
      
   
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesShoes, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesShoes) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesShoes, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesShoes, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesShoes, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesShoes, index: index, value: model);
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