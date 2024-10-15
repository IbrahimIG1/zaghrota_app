import 'package:dartz/dartz.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/core/database_helper/hive_usable.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/error_model.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';

class FathaSongsScreenRepo {
   HiveStorage hiive = HiveStorage();

  Future<Either<ErrorModel,void>> addSongs(SongModel songData)async {
  try {
    await hiive.addValue<SongModel>(boxName: BoxesNames.songsFatha, value: songData);
    return right(null);
  }
  on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  }
  }


Either<ErrorModel,List<SongModel>> getSongs(){
  try {
    List<SongModel> data = hiive.getBoxValues<SongModel>(boxName: BoxesNames.songsFatha) as List<SongModel>;
    return right(data);
  }
    on HiveError catch (e){
    return left(ErrorModel(errormsg: "The error from hive is $e"));

  }
   catch (e) {
    return left(ErrorModel(errormsg: "The error is $e"));
  
  }

}

Future<Either<ErrorModel,void>> updateOrderValue({required int index,required dynamic value})async{
  try {
    List data = hiive.getBoxValues<SongModel>(boxName: BoxesNames.songsFatha);
    if(data.isNotEmpty){
      
    await hiive.updateItem<SongModel>(boxName: BoxesNames.songsFatha, index: index, value:value);
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
    // List data = hiive.getBoxValues(boxName: BoxesNames.songsFatha);
    
    await hiive.deleteItem<SongModel>(boxName: BoxesNames.songsFatha, index: index);
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