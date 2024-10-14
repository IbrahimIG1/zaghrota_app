

import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';

@immutable
sealed class InvitedPeopleHenaScreenState {}

final class InvitedPeopleHenaScreenInitial extends InvitedPeopleHenaScreenState {}

//* Add Data states
final class AddInvitedPeopleHenaScreenLoading extends InvitedPeopleHenaScreenInitial {}
final class AddInvitedPeopleHenaScreenSucess extends InvitedPeopleHenaScreenInitial {}
final class AddInvitedPeopleHenaScreenError extends InvitedPeopleHenaScreenInitial {
  final String errormsg;

  AddInvitedPeopleHenaScreenError({required this.errormsg});
}


 //* Get Data states
final class GetInvitedPeopleHenaScreenLoading extends InvitedPeopleHenaScreenInitial {}

final class GetInvitedPeopleHenaScreenSucess extends InvitedPeopleHenaScreenInitial {
  final List<InvitedModel> invitedPeopleData;
  final int numberOfComings;

  GetInvitedPeopleHenaScreenSucess({required this.numberOfComings, required this.invitedPeopleData});
}

final class GetInvitedPeopleHenaScreenFailure extends InvitedPeopleHenaScreenInitial {
  final String errormsg;

  GetInvitedPeopleHenaScreenFailure({required this.errormsg});
}
