import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/dress_screen/data/repo/dress_screen_repo.dart';


part 'dress_screen_state.dart';

class DressScreenCubit extends Cubit<DressScreenState> {
  DressScreenCubit() : super(DressScreenInitial());
  static DressScreenCubit get(context) => BlocProvider.of<DressScreenCubit>(context);

  
  DressScreenRepo repo = DressScreenRepo();
  void getCheckedData(){
   var result = repo.getData();
   result.fold((l) {
     emit(DressScreenFailure(errormsg: l.errormsg));

   }, 
   (r) {
     emit(DressScreenSuccess(dataChecks: r));
     
   },
   );
  }

  void addData({required bool value})async{
    var result = await repo.addData(value: value);
    result.fold(
      (l) {
        emit(DressScreenFailure(errormsg: l.errormsg));
      },
      (r) {
        getCheckedData();
      },
       );
  }

  void updateCheckedValue({required int index,required bool value})async{
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(DressScreenFailure(errormsg: l.errormsg));
    }, (r) {
      getCheckedData();
    },);
    
  }


}
