import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class DevicesKitchenScreenRepo {
  HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<DevicesModel>> getdata(){
    try{
    List<DevicesModel> data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesKitchen) as List<DevicesModel>;
    if(data.isEmpty){
      List <DevicesModel> localData = [DevicesModel(deviceName: "طقم صيني", number: "1"),
      DevicesModel(deviceName: "طقم ملاعق وشوك", number: "1",),
      DevicesModel(deviceName: "اطباق بلاستيك", number: "1"),
      DevicesModel(deviceName: "طقم معالق توزيع", number: "1"),
      DevicesModel(deviceName: "طقم سكاكين", number: "1"),
      DevicesModel(deviceName: "طقم توابل", number: "1"),
      DevicesModel(deviceName: "علب ثلاجه", number: "1"),
      DevicesModel(deviceName: "طقم بايركس", number: "1"),
      DevicesModel(deviceName: "طقم حلل", number: "1"),
      DevicesModel(deviceName: "صواني فرن", number: "1"),
      DevicesModel(deviceName: "طواجن", number: "1"),
      DevicesModel(deviceName: "طقم جيلي", number: "1"),
      DevicesModel(deviceName: "طقم شاي/قهوه", number: "1"),
      DevicesModel(deviceName: "طاسات للقلي", number: "1"),
      DevicesModel(deviceName: "ملاعق خشب/سيليكون", number: "1"),
      DevicesModel(deviceName: "مبشره", number: "1"),
      DevicesModel(deviceName: "لبانه", number: "1"),
      DevicesModel(deviceName: "كبه", number: "1"),
      DevicesModel(deviceName: "طقم صواني تقديم", number: "1"),
      DevicesModel(deviceName: "مصفاه استنلس", number: "1"),
      DevicesModel(deviceName: "مصفاه بلاستك", number: "1"),
      DevicesModel(deviceName: "زجاجه مياه واكواب", number: "1"),
      DevicesModel(deviceName: "براد شاى", number: "1"),
      DevicesModel(deviceName: "طبق كبير للسلطه", number: "1"),
      DevicesModel(deviceName: "سله مهملات", number: "1"),
      DevicesModel(deviceName: "مقص مطبخ", number: "1"),
      DevicesModel(deviceName: "شياطه الارز", number: "1"),
      DevicesModel(deviceName: "مساكات للحاجه السخنه", number: "1"),
      DevicesModel(deviceName: "حامل مناديل مطبخ", number: "1"),
      DevicesModel(deviceName: "مصفاه صغيره للسوائل", number: "1"),
      DevicesModel(deviceName: "لوح تقطيع", number: "1"),
      DevicesModel(deviceName: "صفايه ملاعق للحوض", number: "1"),
      DevicesModel(deviceName: "كيتشن ماشين", number: "1"),
      DevicesModel(deviceName: "مفرمه ثوم", number: "1"),
      DevicesModel(deviceName: "عصاره ليمون", number: "1"),
      DevicesModel(deviceName: "عصاره برتقال", number: "1"),
      DevicesModel(deviceName: "ميزان مطبخ", number: "1"),
      DevicesModel(deviceName: "فوط مطبخ", number: "1"),
      DevicesModel(deviceName: "سلاطين صغيره", number: "1"),
      DevicesModel(deviceName: "كنكه قهوه", number: "1"),
      DevicesModel(deviceName: "شفشق عصير", number: "1"),
      DevicesModel(deviceName: "ولاعه بوتجاز", number: "1"),
      DevicesModel(deviceName: "مدق بوفتيك", number: "1"),
      DevicesModel(deviceName: "نشابه عجين", number: "1"),
      DevicesModel(deviceName: "اطباق ميكروويف", number: "1"),
      DevicesModel(deviceName: "قطاعه بيتزا", number: "1"),
      DevicesModel(deviceName: "قوالب كيك", number: "1"),
      DevicesModel(deviceName: "مساكه جاتوه", number: "1"),
      DevicesModel(deviceName: "شياله بسكويت", number: "1"),
      DevicesModel(deviceName: "صواني بيتزا", number: "1"),
      DevicesModel(deviceName: "صنيه فطار", number: "1"),
      DevicesModel(deviceName: "طقم خشاف", number: "1"),
      DevicesModel(deviceName: "قوالب ثلج", number: "1"),
      DevicesModel(deviceName: "فتاحه علب", number: "1"),
      DevicesModel(deviceName: "اقماع", number: "1"),
      DevicesModel(deviceName: "مضرب بيض يدوي", number: "1"),
      DevicesModel(deviceName: "فرشاه دهن صواني", number: "1"),
      DevicesModel(deviceName: "هراسة بطاطس", number: "1"),
      DevicesModel(deviceName: "بونبونيرة", number: "1"),
      DevicesModel(deviceName: "كاسات ", number: "1"),
      DevicesModel(deviceName: "طفايه", number: "1"),
      DevicesModel(deviceName: "منخل دقيق", number: "1"),
      DevicesModel(deviceName: "برطمانات تخزين", number: "1"),
      DevicesModel(deviceName: "قشاره بطاطس", number: "1"),
      DevicesModel(deviceName: "قطاعه تفاح", number: "1"),
      DevicesModel(deviceName: "مجات نسكافيه", number: "1"),
      DevicesModel(deviceName: "جوانتي حراره", number: "1"),
      DevicesModel(deviceName: "خلاط", number: "1"),
      DevicesModel(deviceName: "طبق تسالي", number: "1"),
      DevicesModel(deviceName: "طقم عشاء للاستخدام اليومي", number: "1"),
      DevicesModel(deviceName: "قدره فول", number: "1"),
      DevicesModel(deviceName: "صينه كب كيك", number: "1"),
      DevicesModel(deviceName: "طقم سيليكون للفرن", number: "1"),
      DevicesModel(deviceName: "مخرطه ملوخيه", number: "1"),
      DevicesModel(deviceName: "اسياخ شيش طاووق", number: "1"),
      DevicesModel(deviceName: "مخرطه ملوخيه", number: "1"),
      DevicesModel(deviceName: "ولاعه", number: "1"),
      DevicesModel(deviceName: "هون", number: "1"),
      DevicesModel(deviceName: "معالق معياريه", number: "1"),
      DevicesModel(deviceName: "سباتيولا", number: "1"),
      DevicesModel(deviceName: "بخاخه زيت", number: "1"),
      DevicesModel(deviceName: "صفايه معالق", number: "1"),
      DevicesModel(deviceName: "حامل مجات", number: "1"),

      ];
      for(var x in localData){
      hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesKitchen, value: x);
      }
    data =  hiive.getBoxValues<DevicesModel>(boxName: BoxesNames.devicesKitchen) as List<DevicesModel>;
      
    
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
    await hiive.addValue<DevicesModel>(boxName: BoxesNames.devicesKitchen, value: model);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesKitchen, index: index, value: model);
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
      hiive.deleteItem<DevicesModel>(boxName: BoxesNames.devicesKitchen, index: index);
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
  await hiive.updateItem<DevicesModel>(boxName: BoxesNames.devicesKitchen, index: index, value: model);
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