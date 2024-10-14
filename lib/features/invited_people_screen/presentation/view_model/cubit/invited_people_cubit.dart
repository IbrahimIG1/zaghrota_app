import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/repos/invited_people_screen_repo.dart';

part 'invited_people_state.dart';

class InvitedPeopleCubit extends Cubit<InvitedPeopleState> {
  InvitedPeopleCubit() : super(InvitedPeopleInitial());
  final InvitedPeopleScreenRepo repo = InvitedPeopleScreenRepo();
  static InvitedPeopleCubit get(context)=> BlocProvider.of<InvitedPeopleCubit>(context);
GlobalKey<FormState> formKey = GlobalKey();
TextEditingController controlName = TextEditingController();
TextEditingController controlNumber = TextEditingController();


  Future<void> addInvitedPeople()async{
    InvitedModel inviteedModel = InvitedModel(name: controlName.text, numberOfInvitedPeople:int.parse(controlNumber.text.toString()));
    emit(AddInvitedPeopleLoading());
   var result = await repo.addInvitedPeople(inviteedModel);
   result.fold((l){
    emit(AddInvitedPeopleError(errormsg: l.errormsg));
   }, (r) {
    getInvitedPeople();
   } ,);


  } 

  getInvitedPeople(){
      print("get item Start====>>>> ");

    emit(GetInvitedPeopleLoading());
    var result = repo.getInvitedPeople();
    result.fold((l) {
      print("get item failure====>>>> ");

      emit(GetInvitedPeopleFailure(errormsg:l.errormsg ));
    },
     (r) {
      print("get item Success====>>>> ");

      int total = 0;
      for(int x=0;x<r.length;x++){
        if(r[x].checked){
         total=total+ r[x].numberOfInvitedPeople;
         }
      }
      emit(GetInvitedPeopleSucess(invitedPeopleData:r ,numberOfComings: total));
    },);
  }

  updateCheck({required int index,required InvitedModel value})async {
    var result = await repo.updateCheckedValue(index: index, value: value);
    result.fold((l) {
      emit(GetInvitedPeopleFailure(errormsg: l.errormsg));
    },(r) {
      getInvitedPeople();
    },);
  }
    deleteItem({required int index})async {
      print("Delete item Start====>>>> ");
    var result = await repo.deleteValue(index: index,);
    result.fold((l) {
      print("Delete item fail====>>>> ");
      
      emit(GetInvitedPeopleFailure(errormsg: l.errormsg));
    },(r) {
      print("Delete item Success====>>>> ");

      getInvitedPeople();
    },);
  }
}
