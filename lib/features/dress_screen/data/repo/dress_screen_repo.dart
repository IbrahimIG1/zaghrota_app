import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';

class DressScreenRepo {

HiveStorage hiive = HiveStorage();
Either<ErrorModel,List<bool>> getData (){
  try{
  List<bool> data = hiive.getBoxValues<bool>(boxName: BoxesNames.dressChecks) as List<bool>;
  return right(data);
  }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  
  }

}

Future<Either<ErrorModel,void>> addData({required bool value})async{
  List<bool> data = hiive.getBoxValues<bool>(boxName: BoxesNames.dressChecks) as List<bool>;
  if (data.length<16){
    try{
      await hiive.addValue<bool>(boxName: BoxesNames.dressChecks, value:value );
      return right(null);
    }
       on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  
  }
  }
  else{
    return right(null);
  }

}

Future<Either<ErrorModel,void>> updateCheckedValue({required int index,required bool value})async{
  try {
    List data = hiive.getBoxValues<bool>(boxName: BoxesNames.dressChecks);
    if(data.isNotEmpty){
    await hiive.updateItem<bool>(boxName: BoxesNames.dressChecks, index: index, value:value);
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



}