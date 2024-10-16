part of 'devices_electronics_screen_cubit.dart';

@immutable
sealed class DevicesElectronicsScreenState {}

final class DevicesElectronicsScreenInitial extends DevicesElectronicsScreenState {}
final class DevicesElectronicsScreenLoading extends DevicesElectronicsScreenState {}
final class DevicesElectronicsScreenFailure extends DevicesElectronicsScreenState {

  final String errormsg;
  DevicesElectronicsScreenFailure({required this.errormsg});
}
final class DevicesElectronicsScreenSuccess extends DevicesElectronicsScreenState {
  final List<DevicesModel> electronicsDevices;

  DevicesElectronicsScreenSuccess({required this.electronicsDevices});
}
