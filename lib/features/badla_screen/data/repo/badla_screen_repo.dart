import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class BadlaScreenRepo {
   HiveStorage hiive = HiveStorage();

  Future<Either<ErrorModel,void>> addBadlaItem(BadlaModel badlamodel)async {
  try {
    await hiive.addValue<BadlaModel>(boxName: BoxesNames.badlaitems, value: badlamodel);
    return right(null);
  }
  on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Either<ErrorModel,List<BadlaModel>> getBadlaItems(){
  try {
    List<BadlaModel> data = hiive.getBoxValues<BadlaModel>(boxName: BoxesNames.badlaitems) as List<BadlaModel>;
    if(data.isEmpty){
      List<BadlaModel> items = [
     BadlaModel(badlaItemName: "البدلة الرسمية",),
     BadlaModel(badlaItemName: "قميص أبيض",),
     BadlaModel(badlaItemName: "فيست",),
     BadlaModel(badlaItemName: "بنطلون البدلة",),
     BadlaModel(badlaItemName: "ربطة عنق",),
     BadlaModel(badlaItemName: "منديل جيب",),
     BadlaModel(badlaItemName: "أزرار أكمام",),
     BadlaModel(badlaItemName: "دبوس ربطة عنق",),
     BadlaModel(badlaItemName: "حذاء رسمي",),
     BadlaModel(badlaItemName: "جوارب",),
     BadlaModel(badlaItemName: "تيشيرت داخلي قطن",),
     BadlaModel(badlaItemName: "بانتي",),
     BadlaModel(badlaItemName: "حزام",),
     BadlaModel(badlaItemName: "ساعة يد أنيقة",),
     BadlaModel(badlaItemName: "مشبك أو بروش صغير",),
     BadlaModel(badlaItemName: "وردة العروة",),
     BadlaModel(badlaItemName: "نظارة شمسية",),
     BadlaModel(badlaItemName: "روب أو بيجامة",),
     BadlaModel(badlaItemName: "عطر خاص",),
     BadlaModel(badlaItemName: "مشبك حزام",),
     BadlaModel(badlaItemName: "زجاجة عطر صغيرة",),
      ];
      for(var x in items){
      hiive.addValue<BadlaModel>(boxName: BoxesNames.badlaitems, value: x);
      }
    data =  hiive.getBoxValues<BadlaModel>(boxName: BoxesNames.badlaitems) as List<BadlaModel>;
    
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

Future<Either<ErrorModel,void>> updateCheckedValue({required int index,required dynamic value})async{
  try {
    List data = hiive.getBoxValues<BadlaModel>(boxName: BoxesNames.badlaitems);
    if(data.isNotEmpty){
    await hiive.updateItem<BadlaModel>(boxName: BoxesNames.badlaitems, index: index, value:value);
    return right(null);
    }
    else{
      return right(null);
    }
  }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
    
  }
  
}

Future<Either<ErrorModel,Null>> deleteValue({required int index})async{
  try {
    // List data = hiive.getBoxValues(boxName: BoxesNames.invitedPeoples);
    
    await hiive.deleteItem<BadlaModel>(boxName: BoxesNames.badlaitems, index: index);
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