part of 'fatha_invited_people_screen_cubit.dart';

@immutable
sealed class FathaInvitedPeopleScreenState {}

final class FathaInvitedPeopleScreenInitial extends FathaInvitedPeopleScreenState {}
final class AddFathaInvitedPeopleScreenLoading extends FathaInvitedPeopleScreenInitial {}
final class AddFathaInvitedPeopleScreenSucess extends FathaInvitedPeopleScreenInitial {}
final class AddFathaInvitedPeopleScreenError extends FathaInvitedPeopleScreenInitial {
  final String errormsg;

  AddFathaInvitedPeopleScreenError({required this.errormsg});
}


 //* Get Data states
final class GetFathaInvitedPeopleScreenLoading extends FathaInvitedPeopleScreenInitial {}

final class GetFathaInvitedPeopleScreenSucess extends FathaInvitedPeopleScreenInitial {
  final List<InvitedModel> invitedPeopleData;
  final int numberOfComings;

  GetFathaInvitedPeopleScreenSucess({required this.numberOfComings, required this.invitedPeopleData});
}

final class GetFathaInvitedPeopleScreenFailure extends FathaInvitedPeopleScreenInitial {
  final String errormsg;

  GetFathaInvitedPeopleScreenFailure({required this.errormsg});
}