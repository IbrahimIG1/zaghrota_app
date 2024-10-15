part of 'shabka_songs_screen_cubit.dart';

@immutable
sealed class ShabkaSongsScreenState {}

final class ShabkaSongsScreenInitial extends ShabkaSongsScreenState {}
final class ShabkaSongsScreenSuccess extends ShabkaSongsScreenState {
  final List<SongModel> songs;

  ShabkaSongsScreenSuccess({required this.songs});
  
}
final class ShabkaSongsScreenLoading extends ShabkaSongsScreenState {}
final class ShabkaSongsScreenFailure extends ShabkaSongsScreenState {
  final String errormsg;

  ShabkaSongsScreenFailure({required this.errormsg});
}
