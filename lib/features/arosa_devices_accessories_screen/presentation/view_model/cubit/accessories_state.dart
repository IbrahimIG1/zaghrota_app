part of 'accessories_cubit.dart';

@immutable
sealed class AccessoriesState {}

final class AccessoriesInitial extends AccessoriesState {}
final class AccessoriesLoading extends AccessoriesState {}
final class AccessoriesFailure extends AccessoriesState {

  final String errormsg;
  AccessoriesFailure({required this.errormsg});
}
final class AccessoriesSuccess extends AccessoriesState {
  final List<DevicesModel> electronicsDevices;

  AccessoriesSuccess({required this.electronicsDevices});
}

