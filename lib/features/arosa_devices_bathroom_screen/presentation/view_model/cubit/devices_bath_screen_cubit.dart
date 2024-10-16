import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/repo/arosa_devices_barh_screen_repo.dart';

part 'devices_bath_screen_state.dart';

class DevicesBathScreenCubit extends Cubit<DevicesBathScreenState> {
  DevicesBathScreenCubit() : super(DevicesBathScreenInitial());
  ArosaDevicesBarhScreenRepo repo = ArosaDevicesBarhScreenRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static DevicesBathScreenCubit get(context)=> BlocProvider.of<DevicesBathScreenCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getData (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(DevicesBathScreenFailure(errormsg: l.errormsg));
  }
  , (r) {
    print(r.length.toString());
    emit(DevicesBathScreenSuccess(bathDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(DevicesBathScreenFailure(errormsg: l.errormsg));
}, (r) {
  print("add success");
  getData();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(DevicesBathScreenFailure(errormsg: l.errormsg));
}, (r) {
  getData();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(DevicesBathScreenFailure(errormsg: l.errormsg));
}, (r) {
  getData();
},);
}
}
