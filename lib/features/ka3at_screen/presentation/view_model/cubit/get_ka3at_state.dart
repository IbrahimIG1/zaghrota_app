part of 'get_ka3at_cubit.dart';

@immutable
sealed class Getka3aState {}

final class Getka3aInitial extends Getka3aState {}
final class Getka3aLoading extends Getka3aState {}
final class Getka3aError extends Getka3aState {
  final String errorMsg;

  Getka3aError({required this.errorMsg});
  
}
final class Getka3aSuccess extends Getka3aState {
  final List<Ka3aModel> ka3at;

  Getka3aSuccess({required this.ka3at});
}
