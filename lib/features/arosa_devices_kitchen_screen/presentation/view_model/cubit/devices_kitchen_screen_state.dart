part of 'devices_kitchen_screen_cubit.dart';

@immutable
sealed class DevicesKitchenScreenState {}

final class DevicesKitchenScreenInitial extends DevicesKitchenScreenState {}
final class DevicesKitchenScreenLoading extends DevicesKitchenScreenState {}
final class DevicesKitchenScreenFailure extends DevicesKitchenScreenState {

  final String errormsg;
  DevicesKitchenScreenFailure({required this.errormsg});
}
final class DevicesKitchenScreenSuccess extends DevicesKitchenScreenState {
  final List<DevicesModel> kitchenDevices;

  DevicesKitchenScreenSuccess({required this.kitchenDevices});
}
