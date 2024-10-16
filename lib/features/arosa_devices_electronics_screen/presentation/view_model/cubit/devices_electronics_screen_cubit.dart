import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_electronics_screen/data/repo/arosa_devices_electronics_screen_repo.dart';

part 'devices_electronics_screen_state.dart';

class DevicesElectronicsScreenCubit extends Cubit<DevicesElectronicsScreenState> {
  DevicesElectronicsScreenCubit() : super(DevicesElectronicsScreenInitial());
   ArosaDevicesElectronicsScreenRepo repo = ArosaDevicesElectronicsScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static DevicesElectronicsScreenCubit get(context)=> BlocProvider.of<DevicesElectronicsScreenCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(DevicesElectronicsScreenFailure(errormsg: l.errormsg));
  }
  , (r) {
    print(r.length.toString());
    emit(DevicesElectronicsScreenSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(DevicesElectronicsScreenFailure(errormsg: l.errormsg));
}, (r) {
  print("add success");
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(DevicesElectronicsScreenFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(DevicesElectronicsScreenFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}
}
