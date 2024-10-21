import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesAccessoriesScreenRepo {
    HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesAccessories) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "نظارات شمسيه ", number: "1"),
      DevicesModel(deviceName: "حقيبه يد كبيره", number: "1",),
      DevicesModel(deviceName: "حقيبه يد صغيره", number: "1"),
      DevicesModel(deviceName: "حقيبه يد رسميه ", number: "1"),
      DevicesModel(deviceName: "حقيبه يد كاجوال", number: "1"),
      DevicesModel(deviceName: "حزام جلد", number: "1"),
      DevicesModel(deviceName: "حزام قماش", number: "1"),
      DevicesModel(deviceName: "قلائد قصيره", number: "1"),
      DevicesModel(deviceName: "قلائد طويله", number: "1"),
      DevicesModel(deviceName: "اساور ذهب", number: "1"),
      DevicesModel(deviceName: "اساور فضه", number: "1"),
      DevicesModel(deviceName: "اقراط كبيره ", number: "1"),
      DevicesModel(deviceName: "اقراط صغيره", number: "1"),
      DevicesModel(deviceName: "قبعات صيف", number: "1"),
      DevicesModel(deviceName: "قبعات شتويه صوف", number: "1"),
      DevicesModel(deviceName: "قفازات صوف ", number: "1"),
      DevicesModel(deviceName: "قفازات جلد", number: "1"),
      DevicesModel(deviceName: "وشاح صوف", number: "1"),
      DevicesModel(deviceName: "وشاح حرير", number: "1"),
      DevicesModel(deviceName: "جوارب شفافه", number: "1"),
      DevicesModel(deviceName: "ملابس شهر العسل شفافه", number: "1"),
      DevicesModel(deviceName: "ملابس شهر العسل خفيفه", number: "1"),
      DevicesModel(deviceName: "كيمونو قصير ", number: "1"),
      DevicesModel(deviceName: "كيمونو طويل", number: "1"),
      DevicesModel(deviceName: "بدله قطعه واحده (جمبسوت)", number: "1"),
   
      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesAccessories, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesAccessories) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesAccessories, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesAccessories, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesAccessories, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesAccessories, index: index, value: model);
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