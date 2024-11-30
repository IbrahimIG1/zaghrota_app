import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/features/shabka_songs_screen/data/repo/shabka_songs_repo.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';

part 'shabka_songs_screen_state.dart';

class ShabkaSongsScreenCubit extends Cubit<ShabkaSongsScreenState> {
  ShabkaSongsScreenCubit() : super(ShabkaSongsScreenInitial());
  ShabkaSongsRepo repo = ShabkaSongsRepo();
static ShabkaSongsScreenCubit get(context)=> BlocProvider.of<ShabkaSongsScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlSingerName = TextEditingController();
TextEditingController controlSingerEditName = TextEditingController();
TextEditingController controlSongName = TextEditingController();
TextEditingController controlSongEditName = TextEditingController();
TextEditingController controlOrder = TextEditingController();
TextEditingController controlSongType = TextEditingController();
TextEditingController controlEditType = TextEditingController();

Future<void> addSong()async{
    SongModel songModel = SongModel(
      singerName: controlSingerName.text,
       songName: controlSongName.text,
       songType: controlSongType.text
       
       );
    
   var result = await repo.addSongs(songModel);
   result.fold((l){
    emit(ShabkaSongsScreenFailure(errormsg: l.errormsg));
   }, (r) {
    getSongs();
   } ,);


  } 

  void getSongs(){
      

    
    var result = repo.getSongs();
    result.fold((l) {
      

      emit(ShabkaSongsScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      
      emit(ShabkaSongsScreenSuccess(songs:r,));
    },);
  }

  void updateOrder({required int oldIndex,required int newIndex})async {
    var result = repo.getSongs();
    
    result.fold((l) {
      emit(ShabkaSongsScreenFailure(errormsg: l.errormsg));
    },(r) async{
      if(r.isNotEmpty && r.length>1){
      var item = r.removeAt(oldIndex);
      r.insert(newIndex, item);
      var box = Hive.box<SongModel>(BoxesNames.songsShabka); 
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
      
      
      emit(ShabkaSongsScreenFailure(errormsg: l.errormsg));
    },(r) {
      

      getSongs();
    },);
  }

void updateData({required int index,required SongModel song})async{
    var result =await repo.updataSongData(index: index, song:song);
    result.fold((l) {
   emit(ShabkaSongsScreenFailure(errormsg: l.errormsg));     
    }, 
    (r) {
      getSongs();
    },);
  }
}
