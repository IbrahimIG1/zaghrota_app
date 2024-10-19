part of 'clothes_screen_cubit.dart';

@immutable
sealed class ClothesScreenState {}

final class ClothesScreenInitial extends ClothesScreenState {}
final class ClothesScreenLoading extends ClothesScreenState {}

final class ClothesScreenSuccess extends ClothesScreenState {
  final List<bool> dataChecks;

  ClothesScreenSuccess({required this.dataChecks});
  
}
final class ClothesScreenFailure extends ClothesScreenState {
  final String errormsg;

  ClothesScreenFailure({required this.errormsg});


}