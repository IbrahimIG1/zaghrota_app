part of 'get_modn_cubit.dart';

@immutable
sealed class GetModnState {}

final class GetModnInitial extends GetModnState {}
final class GetModnLoading extends GetModnState {}
final class GetModnError extends GetModnState {
  final String errorMsg;

  GetModnError({required this.errorMsg});
}
final class GetModnSuccess extends GetModnState {
  final List<MadinaModel> modn;

  GetModnSuccess({required this.modn});
}
