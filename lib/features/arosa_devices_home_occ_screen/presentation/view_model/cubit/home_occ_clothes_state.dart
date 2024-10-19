part of 'home_occ_clothes_cubit.dart';

@immutable
sealed class HomeOccClothesState {}

final class HomeOccClothesInitial extends HomeOccClothesState {}
final class HomeOccClothesLoading extends HomeOccClothesState {}
final class HomeOccClothesFailure extends HomeOccClothesState {

  final String errormsg;
  HomeOccClothesFailure({required this.errormsg});
}
final class HomeOccClothesSuccess extends HomeOccClothesState {
  final List<DevicesModel> electronicsDevices;

  HomeOccClothesSuccess({required this.electronicsDevices});
}