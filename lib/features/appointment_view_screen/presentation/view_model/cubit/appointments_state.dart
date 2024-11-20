part of 'appointments_cubit.dart';

@immutable
sealed class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}
final class AppointmentsLoading extends AppointmentsState {}
final class GetAppointmentsSuccess extends AppointmentsState {
  final List<NotaApiModel> notes;

  GetAppointmentsSuccess({required this.notes});
  
}
final class AppointmentsFailure extends AppointmentsState {
  final String errorMsg;

  AppointmentsFailure({required this.errorMsg});
}
