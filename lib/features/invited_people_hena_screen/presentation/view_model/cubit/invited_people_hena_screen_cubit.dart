import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/invited_people_hena_screen/data/repo/invited_people_hena_screen_repo.dart';

import 'package:zaghrota_app/features/invited_people_hena_screen/presentation/view_model/cubit/invited_people_hena_screen_state.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';



class InvitedPeopleHenaScreenCubit extends Cubit<InvitedPeopleHenaScreenState> {
  InvitedPeopleHenaScreenCubit() : super(InvitedPeopleHenaScreenInitial());
   final InvitedPeopleHenaScreenRepo repo = InvitedPeopleHenaScreenRepo();
  static InvitedPeopleHenaScreenCubit get(context)=> BlocProvider.of<InvitedPeopleHenaScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlName = TextEditingController();
TextEditingController controlNumber = TextEditingController();


  Future<void> addInvitedPeople()async{
    InvitedModel inviteedModel = InvitedModel(name: controlName.text, numberOfInvitedPeople:int.parse(controlNumber.text.toString()));
    emit(AddInvitedPeopleHenaScreenLoading());
   var result = await repo.addInvitedPeople(inviteedModel);
   result.fold((l){
    emit(AddInvitedPeopleHenaScreenError(errormsg: l.errormsg));
   }, (r) {
    getInvitedPeople();
   } ,);


  } 

  getInvitedPeople(){
      print("get item Start====>>>> ");

    emit(GetInvitedPeopleHenaScreenLoading());
    var result = repo.getInvitedPeople();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(GetInvitedPeopleHenaScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");

      int total = 0;
      for(int x=0;x<r.length;x++){
        if(r[x].checked){
         total=total+ r[x].numberOfInvitedPeople;
         }
      }
      emit(GetInvitedPeopleHenaScreenSucess(invitedPeopleData:r ,numberOfComings: total));
    },);
  }

  updateCheck({required int index,required InvitedModel value})async {
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(GetInvitedPeopleHenaScreenFailure(errormsg: l.errormsg));
    },(r) {
      getInvitedPeople();
    },);
  }
    deleteItem({required int index})async {
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(GetInvitedPeopleHenaScreenFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getInvitedPeople();
    },);
  }
}
