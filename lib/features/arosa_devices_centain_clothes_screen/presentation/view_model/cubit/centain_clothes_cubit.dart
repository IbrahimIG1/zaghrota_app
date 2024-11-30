import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_centain_clothes_screen/data/arosa_device_centian_clothes_repo.dart';

part 'centain_clothes_state.dart';

class CentainClothesCubit extends Cubit<CentainClothesState> {
  CentainClothesCubit() : super(CentainClothesInitial());
   ArosaDeviceCentianClothesRepo repo = ArosaDeviceCentianClothesRepo();
GlobalKey<FormState> formKey = GlobalKey();
 static CentainClothesCubit get(context)=> BlocProvider.of<CentainClothesCubit>(context);
 TextEditingController devicenamecont =TextEditingController();
 TextEditingController numbercont =TextEditingController();
void getDaata (){
var result = repo.getdata();
result.fold(
  (l) {
    emit(CentainClothesFailure(errormsg: l.errormsg));
  }
  , (r) {
    
    emit(CentainClothesSuccess(electronicsDevices: r));
  },);
}

void addData()async {
 var result = await repo.addData(model: DevicesModel(deviceName:devicenamecont.text , number: numbercont.text,checked: false));
result.fold((l) {
  emit(CentainClothesFailure(errormsg: l.errormsg));
}, (r) {
  
  
  getDaata();
},);
}

void updateCheck ({required int index,required DevicesModel model})async{
  var result = await repo.updateCheck(index: index, model: model);
  result.fold((l) {
  emit(CentainClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

void deleteItem({required int index}){
  var result = repo.deleteItem(index: index);
  result.fold((l) {
  emit(CentainClothesFailure(errormsg: l.errormsg));
}, (r) {
  getDaata();
},);
}

}
