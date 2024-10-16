part of 'devices_honey_month_screen_cubit.dart';

@immutable
sealed class DevicesHoneyMonthScreenState {}

final class DevicesHoneyMonthScreenInitial extends DevicesHoneyMonthScreenState {}
final class DevicesHoneyMonthScreenLoading extends DevicesHoneyMonthScreenState {}
final class DevicesHoneyMonthScreenFailure extends DevicesHoneyMonthScreenState {

  final String errormsg;
  DevicesHoneyMonthScreenFailure({required this.errormsg});
}
final class DevicesHoneyMonthScreenSuccess extends DevicesHoneyMonthScreenState {
  final List<DevicesModel> honeyMonthDevices;

  DevicesHoneyMonthScreenSuccess({required this.honeyMonthDevices});
}