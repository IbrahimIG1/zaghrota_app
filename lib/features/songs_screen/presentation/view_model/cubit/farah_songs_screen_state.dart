part of 'farah_songs_screen_cubit.dart';

@immutable
sealed class FarahSongsScreenState {}

final class FarahSongsScreenInitial extends FarahSongsScreenState {}
final class FarahSongsScreenSuccess extends FarahSongsScreenState {
  final List<SongModel> songs;

  FarahSongsScreenSuccess({required this.songs});
  
}
final class FarahSongsScreenLoading extends FarahSongsScreenState {}
final class FarahSongsScreenFailure extends FarahSongsScreenState {
  final String errormsg;

  FarahSongsScreenFailure({required this.errormsg});
}
