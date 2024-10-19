part of 'formal_clothes_cubit.dart';

@immutable
sealed class FormalClothesState {}

final class FormalClothesInitial extends FormalClothesState {}
final class FormalClothesLoading extends FormalClothesState {}
final class FormalClothesFailure extends FormalClothesState {

  final String errormsg;
  FormalClothesFailure({required this.errormsg});
}
final class FormalClothesSuccess extends FormalClothesState {
  final List<DevicesModel> electronicsDevices;

  FormalClothesSuccess({required this.electronicsDevices});
}