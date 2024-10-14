

import 'package:flutter/material.dart';
import 'package:zaghrota_app/features/invited_people_screen/data/model/invited_model.dart';

@immutable
sealed class InvitedPeopleScreenShabkaState {}

final class InvitedPeopleScreenShabkaStateInitial extends InvitedPeopleScreenShabkaState {}

//* Add Data states
final class AddInvitedPeopleScreenShabkaStateLoading extends InvitedPeopleScreenShabkaStateInitial {}
final class AddInvitedPeopleScreenShabkaStateSucess extends InvitedPeopleScreenShabkaStateInitial {}
final class AddInvitedPeopleScreenShabkaStateError extends InvitedPeopleScreenShabkaStateInitial {
  final String errormsg;

  AddInvitedPeopleScreenShabkaStateError({required this.errormsg});
}


 //* Get Data states
final class GetInvitedPeopleScreenShabkaStateLoading extends InvitedPeopleScreenShabkaStateInitial {}

final class GetInvitedPeopleScreenShabkaStateSucess extends InvitedPeopleScreenShabkaStateInitial {
  final List<InvitedModel> invitedPeopleData;
  final int numberOfComings;

  GetInvitedPeopleScreenShabkaStateSucess({required this.numberOfComings, required this.invitedPeopleData});
}

final class GetInvitedPeopleScreenShabkaStateFailure extends InvitedPeopleScreenShabkaStateInitial {
  final String errormsg;

  GetInvitedPeopleScreenShabkaStateFailure({required this.errormsg});
}
