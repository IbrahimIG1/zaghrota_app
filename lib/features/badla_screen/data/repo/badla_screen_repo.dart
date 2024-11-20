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
     //yes 0
     BadlaModel(badlaItemName: "قميص أبيض",),
     //yes 1
     BadlaModel(badlaItemName: "فيست",),
     //yes 2
     BadlaModel(badlaItemName: "بنطلون البدلة",),
     //yes 3
     BadlaModel(badlaItemName: "ربطة عنق",),
     //yes 4
     BadlaModel(badlaItemName: "منديل جيب",),
     //yes 5
     BadlaModel(badlaItemName: "أزرار أكمام",),
     //yes 6
     BadlaModel(badlaItemName: "دبوس ربطة عنق",),
     //yes 7
     BadlaModel(badlaItemName: "حذاء رسمي",),
     //yes 8
     BadlaModel(badlaItemName: "جوارب",),
     //yes 9
     BadlaModel(badlaItemName: "تيشيرت داخلي قطن",),
     //yes 10
     BadlaModel(badlaItemName: "بانتي",),
     //yes 11
     BadlaModel(badlaItemName: "حزام",),
     //yes 12
     BadlaModel(badlaItemName: "ساعة يد أنيقة",),
     //yes 13
     BadlaModel(badlaItemName: "مشبك أو بروش صغير",),
     //yes 14
     BadlaModel(badlaItemName: "نظارة شمسية",),
      //yes 14
     BadlaModel(badlaItemName: "عطر خاص",),
    //yes 15
     BadlaModel(badlaItemName: "وردة العروة",),
     BadlaModel(badlaItemName: "روب أو بيجامة",),
     BadlaModel(badlaItemName: "مشبك حزام",),
     
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