part of 'devices_mafroshaat_screen_cubit.dart';

@immutable
sealed class DevicesMafroshaatScreenState {}

final class DevicesMafroshaatScreenInitial extends DevicesMafroshaatScreenState {}
final class DevicesMafroshaatScreenLoading extends DevicesMafroshaatScreenState {}
final class DevicesMafroshaatScreenFailure extends DevicesMafroshaatScreenState {

  final String errormsg;
  DevicesMafroshaatScreenFailure({required this.errormsg});
}
final class DevicesMafroshaatScreenSuccess extends DevicesMafroshaatScreenState {
  final List<DevicesModel> mafroshaatDevices;

  DevicesMafroshaatScreenSuccess({required this.mafroshaatDevices});
}
