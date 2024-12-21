

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/features/appointment_view_screen/data/model/note_api_model.dart';
import 'package:zaghrota_app/features/appointment_view_screen/data/repo/appointment_view_repo.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsCubit() : super(AppointmentsInitial());
  GlobalKey<FormState> keey = GlobalKey<FormState>();
  AppointmentViewRepo repo = AppointmentViewRepo();
  TextEditingController dateCont = TextEditingController();
  TextEditingController titleCont = TextEditingController();
  TextEditingController descCont = TextEditingController();
  static AppointmentsCubit get(BuildContext context)=> BlocProvider.of<AppointmentsCubit>(context);
  

  void adddata({required String type})async {
    var result = await repo.addApointment(date: dateCont.text, title: titleCont.text, 
    content: descCont.text, type: type);

    result.fold((l) {
      emit(AppointmentsFailure(errorMsg: l.errormsg));
    }, (r) {
      AdsHelper().interstitialAdshow();
      getdata(type: type,useLoading: false);
    },);
  }

  void getdata({required String type,required bool useLoading})async{
    if(useLoading){
    emit(AppointmentsLoading());
    }
    var result = await repo.getData(type: type);
    result.fold((l) {
      emit(AppointmentsFailure(errorMsg: l.errormsg));
    }, 
    (r) {
      emit(GetAppointmentsSuccess(notes: r));
    },
    );

  }
  
  void deletedata({required String noteId,required String type})async{
    emit(AppointmentsLoading());
    var result = await repo.deleteNote(noteId: noteId);

    result.fold((l) {
      emit(AppointmentsFailure(errorMsg: l.errormsg));
    }, (r) {
      getdata(type: type,useLoading: false);
    },);

  }
}
