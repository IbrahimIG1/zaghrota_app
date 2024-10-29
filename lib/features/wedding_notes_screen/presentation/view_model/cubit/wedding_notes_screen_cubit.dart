import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/model/note_model.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/data/repo/wedding_notes_screen_repo.dart';

part 'wedding_notes_screen_state.dart';

class WeddingNotesScreenCubit extends Cubit<WeddingNotesScreenState> {
  WeddingNotesScreenCubit() : super(WeddingNotesScreenInitial());
  WeddingNotesScreenRepo repo = WeddingNotesScreenRepo();
  static WeddingNotesScreenCubit get(context)=>BlocProvider.of<WeddingNotesScreenCubit>(context);
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  GlobalKey<FormState> keey = GlobalKey<FormState>();
  TextEditingController datecont= TextEditingController();

  void getdata(){
    var result = repo.getdata();
    result.fold(
      (l) {
        emit(WeddingNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        emit(WeddingNotesScreenSuccess(notes: r));
      },
      );
  }

  Future<void> addData()async {
    var result = await repo.addData(note: NoteModel(title: title.text, content: content.text, date: DateTime.parse(datecont.text.toString())));

    result.fold(
      (l) {
        emit(WeddingNotesScreenFailure(errormsg: l.errormsg));
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
        emit(WeddingNotesScreenFailure(errormsg: l.errormsg));
      }
      , 
      (r) {
        getdata();
      },
      );
  }
}
