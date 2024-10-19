part of 'centain_clothes_cubit.dart';

@immutable
sealed class CentainClothesState {}

final class CentainClothesInitial extends CentainClothesState {}
final class CentainClothesLoading extends CentainClothesState {}
final class CentainClothesFailure extends CentainClothesState {

  final String errormsg;
  CentainClothesFailure({required this.errormsg});
}
final class CentainClothesSuccess extends CentainClothesState {
  final List<DevicesModel> electronicsDevices;

  CentainClothesSuccess({required this.electronicsDevices});
}
