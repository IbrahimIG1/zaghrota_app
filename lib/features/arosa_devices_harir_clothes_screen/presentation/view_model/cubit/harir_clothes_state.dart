part of 'harir_clothes_cubit.dart';

@immutable
sealed class HarirClothesState {}

final class HarirClothesInitial extends HarirClothesState {}
final class HarirClothesLoading extends HarirClothesState {}
final class HarirClothesFailure extends HarirClothesState {

  final String errormsg;
  HarirClothesFailure({required this.errormsg});
}
final class HarirClothesSuccess extends HarirClothesState {
  final List<DevicesModel> electronicsDevices;

  HarirClothesSuccess({required this.electronicsDevices});
}
