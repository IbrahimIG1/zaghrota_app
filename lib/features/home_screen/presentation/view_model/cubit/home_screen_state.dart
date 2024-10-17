part of 'home_screen_cubit.dart';

@immutable
sealed class HomeScreenState {}

final class HomeScreenInitial extends HomeScreenState {}
final class HomeScreenLoading extends HomeScreenState {}
final class HomeScreenSuccess extends HomeScreenState {

 final List<FarahModel> data;

  HomeScreenSuccess({required this.data});

}
final class HomeScreenFailure extends HomeScreenState {
  final String errormsg;

  HomeScreenFailure({required this.errormsg});
}