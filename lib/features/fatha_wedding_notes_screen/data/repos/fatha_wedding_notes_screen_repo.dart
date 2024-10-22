import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';

class FathaWeddingNotesScreenRepo {
    HiveStorage hiive = HiveStorage();

  Either<ErrorModel,List<NoteModel>> getdata(){
    try{
    List<NoteModel> data =  hiive.getBoxValues<NoteModel>(boxName:BoxesNames.fathaNotesBox) as List<NoteModel>;
    return right(data);

    }
  on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }

  }
  Future<Either<ErrorModel,void>> addData({required NoteModel note})async{
    try{
       await hiive.addValue<NoteModel>(boxName: BoxesNames.fathaNotesBox, value: note);
       return right(null);
    }

    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }

 Future<Either<ErrorModel,void>> deleteData({required int index})async{

  try{
    await hiive.deleteItem<NoteModel>(boxName: BoxesNames.fathaNotesBox, index: index);
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