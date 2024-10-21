import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_r2s_clothes_screen/data/arosa_devices_r2s_clothes_screen_repo.dart';

part 'r2s_clothes_state.dart';

class R2sClothesCubit extends Cubit<R2sClothesState> {
  R2sClothesCubit() : super(R2sClothesInitial());
   ArosaDevicesR2sClothesScreenRepo repo = ArosaDevicesR2sClothesScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static R2sClothesCubit get(context)=> BlocProvider.of<R2sClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(R2sClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    print(r.length.toString());
    emit(R2sClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(R2sClothesFailure(errormsg: l.errormsg));
}, (r) {
  print("add success");
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(R2sClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(R2sClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}
}
