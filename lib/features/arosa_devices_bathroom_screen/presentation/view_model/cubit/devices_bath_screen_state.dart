part of 'devices_bath_screen_cubit.dart';

@immutable
sealed class DevicesBathScreenState {}

final class DevicesBathScreenInitial extends DevicesBathScreenState {}
final class DevicesBathScreenLoading extends DevicesBathScreenState {}
final class DevicesBathScreenFailure extends DevicesBathScreenState {

  final String errormsg;
  DevicesBathScreenFailure({required this.errormsg});
}
final class DevicesBathScreenSuccess extends DevicesBathScreenState {
  final List<DevicesModel> bathDevices;

  DevicesBathScreenSuccess({required this.bathDevices});
}

