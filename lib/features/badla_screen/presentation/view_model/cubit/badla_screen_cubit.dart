import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/badla_screen/data/model/badla_model.dart';
import 'package:zaghrota_app/features/badla_screen/data/repo/badla_screen_repo.dart';

part 'badla_screen_state.dart';

class BadlaScreenCubit extends Cubit<BadlaScreenState> {
  BadlaScreenCubit() : super(BadlaScreenInitial());

final BadlaScreenRepo repo = BadlaScreenRepo();
static BadlaScreenCubit get(context)=> BlocProvider.of<BadlaScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlName = TextEditingController();


void getBadlaItems(){
  emit(BadlaScreenLoading());
  var result = repo.getBadlaItems();
  result.fold((l) {
    emit(BadlaScreenFailure(errormsg: l.errormsg));
  }, (r) {
    emit(BadlaScreenSuccess(badlaItems: r));
  },);
}

void addBadlaItem ()async{
  emit(BadlaScreenLoading());
var result =  await repo.addBadlaItem(BadlaModel(badlaItemName: controlName.text));
result.fold((l) {
  emit(BadlaScreenFailure(errormsg: l.errormsg));
}, (r) {
  getBadlaItems();
},);
}

void updateCheckedValue({required int index,required BadlaModel badlamodel})async {
  emit(BadlaScreenLoading());
  var result = await repo.updateCheckedValue(index: index, value: badlamodel);
  result.fold((l) {
    emit(BadlaScreenFailure(errormsg: l.errormsg));
  }, (r) {
    getBadlaItems();
  },);
}

Future<void> deleteItem({required int index})async{
  emit(BadlaScreenLoading());
  var result = await repo.deleteValue(index: index);
  result.fold((l) {
    emit(BadlaScreenFailure(errormsg: l.errormsg));
  }, 
  (r) {
    getBadlaItems();
  },);

}
}
