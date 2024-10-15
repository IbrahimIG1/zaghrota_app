import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/features/fatha_songs_screen/data/repo/fatha_songs_screen_repo.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';

part 'fatha_songs_screen_state.dart';

class FathaSongsScreenCubit extends Cubit<FathaSongsScreenState> {
  FathaSongsScreenCubit() : super(FathaSongsScreenInitial());
  FathaSongsScreenRepo repo = FathaSongsScreenRepo();
static FathaSongsScreenCubit get(context)=> BlocProvider.of<FathaSongsScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlSingerName = TextEditingController();
TextEditingController controlSongName = TextEditingController();
TextEditingController controlOrder = TextEditingController();
TextEditingController controlSongType = TextEditingController();

Future<void> addSong()async{
    SongModel songModel = SongModel(
      singerName: controlSingerName.text,
       songName: controlSongName.text,
       songType: controlSongType.text
       
       );
    
   var result = await repo.addSongs(songModel);
   result.fold((l){
    emit(FathaSongsScreenFailure(errormsg: l.errormsg));
   }, (r) {
    getSongs();
   } ,);


  } 

  void getSongs(){
      print("get item Start====>>>> ");

    
    var result = repo.getSongs();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(FathaSongsScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");
      emit(FathaSongsScreenSuccess(songs:r,));
    },);
  }

  void updateOrder({required int oldIndex,required int newIndex})async {
    var result = repo.getSongs();
    
    result.fold((l) {
      emit(FathaSongsScreenFailure(errormsg: l.errormsg));
    },(r) async{
      if(r.isNotEmpty && r.length>1){
      var item = r.removeAt(oldIndex);
      r.insert(newIndex, item);
      var box = Hive.box<SongModel>(BoxesNames.songsFatha); 
      await box.clear();
      
      for (var item in r){
        box.add(item);
        getSongs();
      
      }
      }
    },);
  }
    void deleteItem({required int index})async {
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(FathaSongsScreenFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getSongs();
    },);
  }

}
