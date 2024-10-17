import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';

class FarahRepo{
HiveStorage hiive = HiveStorage();

 Future<Either<ErrorModel,void>> addFarahData({required FarahModel farahmodel})async{

  try{
  List<FarahModel> data = hiive.getBoxValues<FarahModel>(boxName: BoxesNames.farahBox) as List<FarahModel>;
  if(data.isEmpty){
  await hiive.addValue<FarahModel>(boxName: BoxesNames.farahBox, value: farahmodel);
  }
  else{
    updateFarahItem(model: farahmodel);
  }
   return right(null);
  }
   on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Either<ErrorModel,List<FarahModel>> getFarahData(){
    try{
      List<FarahModel> data = hiive.getBoxValues<FarahModel>(boxName: BoxesNames.farahBox) as List<FarahModel>;
      return right(data);
    }
     on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

  Future<Either<ErrorModel, void>> updateFarahItem({required FarahModel model})async{
    try{
      await hiive.updateItem<FarahModel>(boxName: BoxesNames.farahBox, index: 0, value: model);
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