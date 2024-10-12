import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/session_screen/data/repo/session_screen_repo.dart';


part 'session_screen_state.dart';

class SessionScreenCubit extends Cubit<SessionScreenState> {
  SessionScreenCubit() : super(SessionScreenInitial());
  static SessionScreenCubit get(context) => BlocProvider.of<SessionScreenCubit>(context);

  
  SessionScreenRepo repo = SessionScreenRepo();
  void getCheckedData(){
   var result = repo.getData();
   result.fold((l) {
     emit(SessionScreenFailure(errormsg: l.errormsg));

   }, 
   (r) {
     emit(SessionScreenSucess(dataChecks: r));
     
   },
   );
  }

  void addData({required bool value})async{
    var result = await repo.addData(value: value);
    result.fold(
      (l) {
        emit(SessionScreenFailure(errormsg: l.errormsg));
      },
      (r) {
        getCheckedData();
      },
       );
  }

  void updateCheckedValue({required int index,required bool value})async{
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(SessionScreenFailure(errormsg: l.errormsg));
    }, (r) {
      getCheckedData();
    },);
    
  }
}
