part of 'devices_daily_clothes_cubit.dart';

@immutable
sealed class DevicesDailyClothesState {}

final class DevicesDailyClothesInitial extends DevicesDailyClothesState {}
final class DevicesDailyClothesLoading extends DevicesDailyClothesState {}
final class DevicesDailyClothesFailure extends DevicesDailyClothesState {

  final String errormsg;
  DevicesDailyClothesFailure({required this.errormsg});
}
final class DevicesDailyClothesSuccess extends DevicesDailyClothesState {
  final List<DevicesModel> electronicsDevices;

  DevicesDailyClothesSuccess({required this.electronicsDevices});
}