import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_home_occ_screen/data/arosa_devices_home_occ_repo.dart';

part 'home_occ_clothes_state.dart';

class HomeOccClothesCubit extends Cubit<HomeOccClothesState> {
  HomeOccClothesCubit() : super(HomeOccClothesInitial());
   ArosaDevicesHomeOccRepo repo = ArosaDevicesHomeOccRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static HomeOccClothesCubit get(context)=> BlocProvider.of<HomeOccClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(HomeOccClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    
    emit(HomeOccClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(HomeOccClothesFailure(errormsg: l.errormsg));
}, (r) {
  
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(HomeOccClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(HomeOccClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

}
