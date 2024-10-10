part of 'badla_screen_cubit.dart';

@immutable
sealed class BadlaScreenState {}

final class BadlaScreenInitial extends BadlaScreenState {}
final class BadlaScreenLoading extends BadlaScreenState {}
final class BadlaScreenSuccess extends BadlaScreenState {
  final List<BadlaModel> badlaItems;

  BadlaScreenSuccess({required this.badlaItems});
}
final class BadlaScreenFailure extends BadlaScreenState{
  final String errormsg;

  BadlaScreenFailure({required this.errormsg});
  
}
