import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_repo.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());
  static HomeScreenCubit get(context)=> BlocProvider.of<HomeScreenCubit>(context);
   FarahRepo repo = FarahRepo();
  void getdata(){
    var result = repo.getFarahData();
    result.fold((l) {
      print("We are in get error: ${l.errormsg}");
      emit(HomeScreenFailure(errormsg: l.errormsg));
    }, (r) {
      print("we are in get success");
      print(r.length.toString());
      emit(HomeScreenSuccess(data: r));
    },);
  }

   void updateFarahItem({required FarahModel model})async {
    var result = await repo.updateFarahItem(model: model);
    result.fold((l) {
      print("we are in update failure");
      emit(HomeScreenFailure(errormsg: l.errormsg));
      
    }, (r) {
      getdata();
    },);
  }
}
