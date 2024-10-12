part of 'session_screen_cubit.dart';

@immutable
sealed class SessionScreenState {}

final class SessionScreenInitial extends SessionScreenState {}
final class SessionScreenSucess extends SessionScreenState {
  final List<bool> dataChecks;

  SessionScreenSucess({required this.dataChecks});

}
final class SessionScreenLoading extends SessionScreenState {}
final class SessionScreenFailure extends SessionScreenState {
    final String errormsg;

  SessionScreenFailure({required this.errormsg});

}
