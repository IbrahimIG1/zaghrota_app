import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class ArosaDevicesBarhScreenRepo {

  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesBath) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "طقم دواسات", number: "12"),
      DevicesModel(deviceName: "مساحه زجاج", number: "12",),
      DevicesModel(deviceName: "سله مهملات صغيره", number: "12"),
      DevicesModel(deviceName: "سبت غسيل", number: "12"),
      DevicesModel(deviceName: "طبق بلاستيك للغسيل", number: "12"),
      DevicesModel(deviceName: "مشابك", number: "12"),
      DevicesModel(deviceName: "منشر غسيل داخلي", number: "12"),
      DevicesModel(deviceName: "مشمع غسيل", number: "12"),
      DevicesModel(deviceName: "شماعات الدولاب", number: "12"),
      DevicesModel(deviceName: "مقشه وجاروف", number: "12"),
      DevicesModel(deviceName: "مساحه ارضيه", number: "12"),
      DevicesModel(deviceName: "جردل مسح", number: "12"),
      DevicesModel(deviceName: "زعافه", number: "12"),
      DevicesModel(deviceName: "فرشاه اسنان", number: "12"),
      DevicesModel(deviceName: "سلاكه بلاعات", number: "12"),
      DevicesModel(deviceName: "فرشاه الوبر للملابس", number: "12"),
      DevicesModel(deviceName: "فرشاه حمام", number: "12"),
      DevicesModel(deviceName: "يفه تنظيف الحوض", number: "12"),
      DevicesModel(deviceName: "شموع", number: "12"),
      DevicesModel(deviceName: "معطر حمام", number: "12"),
      DevicesModel(deviceName: "منظف ارضيات", number: "12"),
      DevicesModel(deviceName: "ملمع زجاج", number: "12"),
      DevicesModel(deviceName: "ملمع خشب", number: "12"),
      DevicesModel(deviceName: "طقم اكسسوارات الحمام", number: "12"),
      DevicesModel(deviceName: "ستاره بانيو", number: "12"),
      DevicesModel(deviceName: "مطهر للاسطح", number: "12"),
      DevicesModel(deviceName: "ورد مجفف", number: "12"),
      DevicesModel(deviceName: "مبخره", number: "12"),

      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesBath, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesBath) as List<DevicesModel>;
      print("fullllllllkhhhhhhhvgggggcggccgcgll");
    
    return right(data);
    

    }
    else{
      print("Noooooooooooooooot Empty");

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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesBath, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesBath, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesBath, index: index);
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