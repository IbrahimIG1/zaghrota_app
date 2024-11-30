import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_unformal_clothes_screen/data/arosa_devices_unfformal_clothes_screen_repo.dart';

part 'unformal_clothes_state.dart';

class UnformalClothesCubit extends Cubit<UnformalClothesState> {
  UnformalClothesCubit() : super(UnformalClothesInitial());
   ArosaDevicesUnfformalClothesScreenRepo repo = ArosaDevicesUnfformalClothesScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static UnformalClothesCubit get(context)=> BlocProvider.of<UnformalClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(UnformalClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    
    emit(UnformalClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(UnformalClothesFailure(errormsg: l.errormsg));
}, (r) {
  
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(UnformalClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(UnformalClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}
}
