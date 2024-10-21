part of 'shoes_clothes_cubit.dart';

@immutable
sealed class ShoesClothesState {}

final class ShoesClothesInitial extends ShoesClothesState {}
final class ShoesClothesLoading extends ShoesClothesState {}
final class ShoesClothesFailure extends ShoesClothesState {

  final String errormsg;
  ShoesClothesFailure({required this.errormsg});
}
final class ShoesClothesSuccess extends ShoesClothesState {
  final List<DevicesModel> electronicsDevices;

  ShoesClothesSuccess({required this.electronicsDevices});
}
