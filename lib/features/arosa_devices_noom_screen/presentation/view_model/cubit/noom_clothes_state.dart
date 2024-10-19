part of 'noom_clothes_cubit.dart';

@immutable
sealed class NoomClothesState {}

final class NoomClothesInitial extends NoomClothesState {}

final class NoomClothesLoading extends NoomClothesState {}
final class NoomClothesFailure extends NoomClothesState {

  final String errormsg;
  NoomClothesFailure({required this.errormsg});
}
final class NoomClothesSuccess extends NoomClothesState {
  final List<DevicesModel> electronicsDevices;

  NoomClothesSuccess({required this.electronicsDevices});
}