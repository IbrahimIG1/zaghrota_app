import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_shabka_screen/data/repos/invited_people_screen_shabka_repo.dart';

import 'package:zaghrota_app/features/invited_people_shabka_screen/presentation/view_model/cubit/invited_people_screen_shabka_state.dart';



class InvitedPeopleScreenShabkaCubit extends Cubit<InvitedPeopleScreenShabkaState> {
  InvitedPeopleScreenShabkaCubit() : super(InvitedPeopleScreenShabkaStateInitial());
   final InvitedPeopleScreenShabkaRepo repo = InvitedPeopleScreenShabkaRepo();
  static InvitedPeopleScreenShabkaCubit get(context)=> BlocProvider.of<InvitedPeopleScreenShabkaCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlName = TextEditingController();
TextEditingController controlNumber = TextEditingController();


  Future<void> addInvitedPeople()async{
    InvitedModel inviteedModel = InvitedModel(name: controlName.text, numberOfInvitedPeople:int.parse(controlNumber.text.toString()));
    emit(AddInvitedPeopleScreenShabkaStateLoading());
   var result = await repo.addInvitedPeople(inviteedModel);
   result.fold((l){
    emit(AddInvitedPeopleScreenShabkaStateError(errormsg: l.errormsg));
   }, (r) {
    getInvitedPeople();
   } ,);


  } 

  getInvitedPeople(){
      print("get item Start====>>>> ");

    emit(GetInvitedPeopleScreenShabkaStateLoading());
    var result = repo.getInvitedPeople();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(GetInvitedPeopleScreenShabkaStateFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");

      int total = 0;
      for(int x=0;x<r.length;x++){
        if(r[x].checked){
         total=total+ r[x].numberOfInvitedPeople;
         }
      }
      emit(GetInvitedPeopleScreenShabkaStateSucess(invitedPeopleData:r ,numberOfComings: total));
    },);
  }

  updateCheck({required int index,required InvitedModel value})async {
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(GetInvitedPeopleScreenShabkaStateFailure(errormsg: l.errormsg));
    },(r) {
      getInvitedPeople();
    },);
  }
    deleteItem({required int index})async {
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(GetInvitedPeopleScreenShabkaStateFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getInvitedPeople();
    },);
  }
}
