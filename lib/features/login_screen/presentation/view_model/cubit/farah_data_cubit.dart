import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_repo.dart';

part 'farah_data_state.dart';

class FarahDataCubit extends Cubit<FarahDataState> {
  FarahDataCubit() : super(FarahDataInitial());
  FarahRepo repo = FarahRepo();
  String? aresName;
  String? arosName;
  DateTime? entrydate;

  static FarahDataCubit get(context) => BlocProvider.of<FarahDataCubit>(context);

  

  void addData(context,FarahModel model)async{
    var result = await repo.addFarahData(farahmodel:model );
    result.fold((l) {
      print("we are in add failure :${l.errormsg}");
      FarahDataFailure(errormsg: l.errormsg);
    }, 
    (r) {
      print("we added it and navigate");
      // getdata();
      emit(FarahDataSuccess());
      ControlNavigation.navigationToController(pageName: ScreenNames.homeScreen, context: context);
      // getdata();
    },);
  }

 
}
