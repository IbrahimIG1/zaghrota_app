import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_sports_clothes_screen/data/arosa_devices_sports_clothes_screen_repo.dart';

part 'sports_clothes_state.dart';

class SportsClothesCubit extends Cubit<SportsClothesState> {
  SportsClothesCubit() : super(SportsClothesInitial());
   ArosaDevicesSportsClothesScreenRepo repo = ArosaDevicesSportsClothesScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static SportsClothesCubit get(context)=> BlocProvider.of<SportsClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(SportsClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    
    emit(SportsClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(SportsClothesFailure(errormsg: l.errormsg));
}, (r) {
 
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(SportsClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(SportsClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}


}
