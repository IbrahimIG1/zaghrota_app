import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/fatha_ma3azzem_screen/data/repo/fatha_ma3azeem_repo.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';

part 'fatha_invited_people_screen_state.dart';

class FathaInvitedPeopleScreenCubit extends Cubit<FathaInvitedPeopleScreenState> {
  FathaInvitedPeopleScreenCubit() : super(FathaInvitedPeopleScreenInitial());
   final FathaMa3azeemRepo repo = FathaMa3azeemRepo();
  static FathaInvitedPeopleScreenCubit get(context)=> BlocProvider.of<FathaInvitedPeopleScreenCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlName = TextEditingController();
TextEditingController controlNumber = TextEditingController();


  Future<void> addInvitedPeople()async{
    InvitedModel inviteedModel = InvitedModel(name: controlName.text, numberOfInvitedPeople:int.parse(controlNumber.text.toString()));
    emit(AddFathaInvitedPeopleScreenLoading());
   var result = await repo.addInvitedPeople(inviteedModel);
   result.fold((l){
    emit(AddFathaInvitedPeopleScreenError(errormsg: l.errormsg));
   }, (r) {
    getInvitedPeople();
   } ,);


  } 

  getInvitedPeople(){
      print("get item Start====>>>> ");

    emit(GetFathaInvitedPeopleScreenLoading());
    var result = repo.getInvitedPeople();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(GetFathaInvitedPeopleScreenFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");

      int total = 0;
      for(int x=0;x<r.length;x++){
        if(r[x].checked){
         total=total+ r[x].numberOfInvitedPeople;
         }
      }
      emit(GetFathaInvitedPeopleScreenSucess(invitedPeopleData:r ,numberOfComings: total));
    },);
  }

  updateCheck({required int index,required InvitedModel value})async {
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(GetFathaInvitedPeopleScreenFailure(errormsg: l.errormsg));
    },(r) {
      getInvitedPeople();
    },);
  }
    deleteItem({required int index})async {
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(GetFathaInvitedPeopleScreenFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getInvitedPeople();
    },);
  }
}
