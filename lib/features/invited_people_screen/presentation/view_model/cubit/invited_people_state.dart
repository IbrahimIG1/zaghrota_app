part of 'invited_people_cubit.dart';

@immutable
sealed class InvitedPeopleState {}

final class InvitedPeopleInitial extends InvitedPeopleState {}

//* Add Data states
final class AddInvitedPeopleLoading extends InvitedPeopleState {}
final class AddInvitedPeopleSucess extends InvitedPeopleState {}
final class AddInvitedPeopleError extends InvitedPeopleState {
  final String errormsg;

  AddInvitedPeopleError({required this.errormsg});
}


 //* Get Data states
final class GetInvitedPeopleLoading extends InvitedPeopleState {}

final class GetInvitedPeopleSucess extends InvitedPeopleState {
  final List<InvitedModel> invitedPeopleData;
  final int numberOfComings;

  GetInvitedPeopleSucess({required this.numberOfComings, required this.invitedPeopleData});
}

final class GetInvitedPeopleFailure extends InvitedPeopleState {
  final String errormsg;

  GetInvitedPeopleFailure({required this.errormsg});
}
