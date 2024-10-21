part of 'r2s_clothes_cubit.dart';

@immutable
sealed class R2sClothesState {}

final class R2sClothesInitial extends R2sClothesState {}
final class R2sClothesLoading extends R2sClothesState {}
final class R2sClothesFailure extends R2sClothesState {

  final String errormsg;
  R2sClothesFailure({required this.errormsg});
}
final class R2sClothesSuccess extends R2sClothesState {
  final List<DevicesModel> electronicsDevices;

  R2sClothesSuccess({required this.electronicsDevices});
}
