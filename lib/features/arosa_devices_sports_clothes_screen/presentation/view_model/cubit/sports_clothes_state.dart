part of 'sports_clothes_cubit.dart';

@immutable
sealed class SportsClothesState {}

final class SportsClothesInitial extends SportsClothesState {}
final class SportsClothesLoading extends SportsClothesState {}
final class SportsClothesFailure extends SportsClothesState {

  final String errormsg;
  SportsClothesFailure({required this.errormsg});
}
final class SportsClothesSuccess extends SportsClothesState {
  final List<DevicesModel> electronicsDevices;

  SportsClothesSuccess({required this.electronicsDevices});
}
