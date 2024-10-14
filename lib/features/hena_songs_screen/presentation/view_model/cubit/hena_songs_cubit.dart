
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zaghrota_app/core/database_helper/boxes_names.dart';
import 'package:zaghrota_app/features/hena_songs_screen/data/repo/hena_songs_repo.dart';
import 'package:zaghrota_app/features/songs_screen/data/models/song_model.dart';

part 'hena_songs_state.dart';

class HenaSongsCubit extends Cubit<HenaSongsState> {
  HenaSongsCubit() : super(HenaSongsInitial());
  HenaSongsRepo repo = HenaSongsRepo();
static HenaSongsCubit get(context)=> BlocProvider.of<HenaSongsCubit>(context);
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
    emit(HenaSongsScreenFailure(errormsg: l.errormsg));
   }, (r) {
    getSongs();
   } ,);


  } 

  void getSongs(){
      print("get item Start====>>>> ");

    
    var result = repo.getSongs();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(HenaSongsScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");
      emit(HenaSongsScreenSuccess(songs:r,));
    },);
  }

  void updateOrder({required int oldIndex,required int newIndex})async {
    var result = repo.getSongs();
    
    result.fold((l) {
      emit(HenaSongsScreenFailure(errormsg: l.errormsg));
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
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(HenaSongsScreenFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getSongs();
    },);
  }

}
