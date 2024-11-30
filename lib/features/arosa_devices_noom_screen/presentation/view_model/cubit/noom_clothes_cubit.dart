import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_noom_screen/data/arosa_devices_noom_screen_repo.dart';

part 'noom_clothes_state.dart';

class NoomClothesCubit extends Cubit<NoomClothesState> {
  NoomClothesCubit() : super(NoomClothesInitial());
   ArosaDevicesNoomScreenRepo repo = ArosaDevicesNoomScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static NoomClothesCubit get(context)=> BlocProvider.of<NoomClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(NoomClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    
    emit(NoomClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(NoomClothesFailure(errormsg: l.errormsg));
}, (r) {
  
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(NoomClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(NoomClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

}
