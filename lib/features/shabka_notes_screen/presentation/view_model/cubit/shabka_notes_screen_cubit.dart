import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/shabka_notes_screen/data/shabka_notes_screen_repo.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';

part 'shabka_notes_screen_state.dart';

class ShabkaNotesScreenCubit extends Cubit<ShabkaNotesScreenState> {
  ShabkaNotesScreenCubit() : super(ShabkaNotesScreenInitial());
    ShabkaNotesScreenRepo repo = ShabkaNotesScreenRepo();
  static ShabkaNotesScreenCubit get(context)=>BlocProvider.of<ShabkaNotesScreenCubit>(context);
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> keey = GlobalKey<FormState>();

  void getdata(){
    var result = repo.getdata();
    result.fold(
      (l) {
        emit(ShabkaNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        emit(ShabkaNotesScreenSuccess(notes: r));
      },
      );
  }

  Future<void> addData()async {
    var result = await repo.addData(note: NoteModel(title: title.text, content: content.text, date: DateTime.now()));

    result.fold(
      (l) {
        emit(ShabkaNotesScreenFailure(errormsg: l.errormsg));
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
        emit(ShabkaNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        getdata();
      },
      );
  }
}
