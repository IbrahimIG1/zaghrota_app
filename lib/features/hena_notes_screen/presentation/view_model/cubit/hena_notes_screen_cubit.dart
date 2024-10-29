import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:zaghrota_app/features/hena_notes_screen/data/hena_notes_screen_repo.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';

part 'hena_notes_screen_state.dart';

class HenaNotesScreenCubit extends Cubit<HenaNotesScreenState> {
  HenaNotesScreenCubit() : super(HenaNotesScreenInitial());
   HenaNotesScreenRepo repo = HenaNotesScreenRepo();
  static HenaNotesScreenCubit get(context)=>BlocProvider.of<HenaNotesScreenCubit>(context);
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> keey = GlobalKey<FormState>();
  TextEditingController datecont = TextEditingController();
  

  void getdata(){
    var result = repo.getdata();
    result.fold(
      (l) {
        emit(HenaNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        emit(HenaNotesScreenSuccess(notes: r));
      },
      );
  }

  Future<void> addData()async {
    var result = await repo.addData(note: NoteModel(title: title.text, content: content.text, date: DateTime.parse(datecont.text.toString())));

    result.fold(
      (l) {
        emit(HenaNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        getdata();
      },
      );
  }

    Future<void> deleteData({required int index})async {
    var result = await repo.deleteData(index: index);

    result.fold(
      (l) {
        emit(HenaNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        getdata();
      },
      );
  }
}
