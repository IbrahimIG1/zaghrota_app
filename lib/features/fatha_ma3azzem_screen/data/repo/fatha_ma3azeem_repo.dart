import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';

class FathaMa3azeemRepo {
    HiveStorage hiive = HiveStorage();

  Future<Either<ErrorModel,void>> addInvitedPeople(InvitedModel inviteData)async {
  try {
    await hiive.addValue<InvitedModel>(boxName: BoxesNames.invitedPeopleFatha, value: inviteData);
    return right(null);
  }
  on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }


Either<ErrorModel,List<InvitedModel>> getInvitedPeople(){
  try {
    List<InvitedModel> data = hiive.getBoxValues<InvitedModel>(boxName: BoxesNames.invitedPeopleFatha) as List<InvitedModel>;
    return right(data);
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
    List data = hiive.getBoxValues<InvitedModel>(boxName: BoxesNames.invitedPeopleFatha);
    if(data.isNotEmpty){
    await hiive.updateItem<InvitedModel>(boxName: BoxesNames.invitedPeopleFatha, index: index, value:value);
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
    // List data = hiive.getBoxValues(boxName: BoxesNames.invitedPeopleFatha);
    
    await hiive.deleteItem<InvitedModel>(boxName: BoxesNames.invitedPeopleFatha, index: index);
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