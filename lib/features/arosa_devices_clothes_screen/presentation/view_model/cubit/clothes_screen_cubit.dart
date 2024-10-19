import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_screen/data/repo/arosa_clothes_repo.dart';

part 'clothes_screen_state.dart';

class ClothesScreenCubit extends Cubit<ClothesScreenState> {
  ClothesScreenCubit() : super(ClothesScreenInitial());
   static ClothesScreenCubit get(context) => BlocProvider.of<ClothesScreenCubit>(context);

  
  ArosaClothesRepo repo = ArosaClothesRepo();
  void getCheckedData(){
   var result = repo.getData();
   result.fold((l) {
     emit(ClothesScreenFailure(errormsg: l.errormsg));

   }, 
   (r) {
     emit(ClothesScreenSuccess(dataChecks: r));
     
   },
   );
  }

  void addData({required bool value})async{
    var result = await repo.addData(value: value);
    result.fold(
      (l) {
        emit(ClothesScreenFailure(errormsg: l.errormsg));
      },
      (r) {
        getCheckedData();
      },
       );
  }

  void updateCheckedValue({required int index,required bool value})async{
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(ClothesScreenFailure(errormsg: l.errormsg));
    }, (r) {
      getCheckedData();
    },);
    
  }



}
