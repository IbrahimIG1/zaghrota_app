part of 'get_mohafza_cubit.dart';

@immutable
sealed class GetMohafzaState {}

final class GetMohafzaInitial extends GetMohafzaState {}
final class GetMohafzaLoading extends GetMohafzaState {}
final class GetMohafzaFailure extends GetMohafzaState {
  final String errorMsg;

  GetMohafzaFailure({required this.errorMsg});
}
final class GetMohafzaSuccess extends GetMohafzaState {
  final List<MohafzaModel> mohafzat;

  GetMohafzaSuccess(this.mohafzat);
}
