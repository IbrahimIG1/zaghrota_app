
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';

import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';
import 'package:zaghrota_app/features/songs_screen/data/repo/fara7_songs_repo.dart';

part 'farah_songs_screen_state.dart';

class FarahSongsScreenCubit extends Cubit<FarahSongsScreenState> {
  FarahSongsScreenCubit() : super(FarahSongsScreenInitial());
Fara7SongsRepo repo = Fara7SongsRepo();
static FarahSongsScreenCubit get(context)=> BlocProvider.of<FarahSongsScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey<FormState>();
GlobalKey<FormState> forEditmKey = GlobalKey<FormState>();
TextEditingController controlSingerName = TextEditingController();
TextEditingController controlEditSingerName = TextEditingController();
TextEditingController controlSongName = TextEditingController();
TextEditingController controlEditSongName = TextEditingController();
TextEditingController controlOrder = TextEditingController();
// TextEditingController controlEditOrder = TextEditingController();
TextEditingController controlSongType = TextEditingController();
TextEditingController controlEditSongType = TextEditingController();

Future<void> addSong()async{
    SongModel songModel = SongModel(
      singerName: controlSingerName.text,
       songName: controlSongName.text,
       songType: controlSongType.text
       
       );
    
   var result = await repo.addSongs(songModel);
   result.fold((l){
    emit(FarahSongsScreenFailure(errormsg: l.errormsg));
   }, (r) {
    getSongs();
    
   } ,);


  } 

  void getSongs(){
     

    
    var result = repo.getSongs();
    result.fold((l) {
      

      emit(FarahSongsScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      
      emit(FarahSongsScreenSuccess(songs:r,));
    },);
  }

  void updateOrder({required int oldIndex,required int newIndex})async {
    var result = repo.getSongs();
    
    result.fold((l) {
      emit(FarahSongsScreenFailure(errormsg: l.errormsg));
    },(r) async{
      if(r.isNotEmpty && r.length>1){
      var item = r.removeAt(oldIndex);
      r.insert(newIndex, item);
      var box = Hive.box<SongModel>(BoxesNames.songsFarah); 
      await box.clear();
      
      for (var item in r){
        box.add(item);
        getSongs();
      
      }
      }
    },);
  }
    void deleteItem({required int index})async {
      
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
     
      
      emit(FarahSongsScreenFailure(errormsg: l.errormsg));
    },(r) {
      

      getSongs();
    },);
  }

  void updateData({required int index,required SongModel song})async{
    var result =await repo.updataSongData(index: index, song:song);
    result.fold((l) {
   emit(FarahSongsScreenFailure(errormsg: l.errormsg));     
    }, 
    (r) {
      getSongs();
    },);
  }

}
