part of 'farah_data_cubit.dart';

@immutable
sealed class FarahDataState {}

final class FarahDataInitial extends FarahDataState {}
final class FarahDataLoading extends FarahDataState {}
final class FarahDataSuccess extends FarahDataState {


}
final class FarahDataFailure extends FarahDataState {
  final String errormsg;

  FarahDataFailure({required this.errormsg});
}

