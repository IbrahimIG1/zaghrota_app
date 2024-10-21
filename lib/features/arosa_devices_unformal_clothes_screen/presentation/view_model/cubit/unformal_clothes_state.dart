part of 'unformal_clothes_cubit.dart';

@immutable
sealed class UnformalClothesState {}

final class UnformalClothesInitial extends UnformalClothesState {}
final class UnformalClothesLoading extends UnformalClothesState {}
final class UnformalClothesFailure extends UnformalClothesState {

  final String errormsg;
  UnformalClothesFailure({required this.errormsg});
}
final class UnformalClothesSuccess extends UnformalClothesState {
  final List<DevicesModel> electronicsDevices;

  UnformalClothesSuccess({required this.electronicsDevices});
}

