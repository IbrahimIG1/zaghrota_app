part of 'dress_screen_cubit.dart';

@immutable
sealed class DressScreenState {}

final class DressScreenInitial extends DressScreenState {}
final class DressScreenLoading extends DressScreenState {}

final class DressScreenSuccess extends DressScreenState {
  final List<bool> dataChecks;

  DressScreenSuccess({required this.dataChecks});
  
}
final class DressScreenFailure extends DressScreenState {
  final String errormsg;

  DressScreenFailure({required this.errormsg});

}
