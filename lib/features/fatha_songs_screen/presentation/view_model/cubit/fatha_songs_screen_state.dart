part of 'fatha_songs_screen_cubit.dart';

@immutable
sealed class FathaSongsScreenState {}


final class FathaSongsScreenInitial extends FathaSongsScreenState {}
final class FathaSongsScreenSuccess extends FathaSongsScreenState {
  final List<SongModel> songs;

  FathaSongsScreenSuccess({required this.songs});
  
}
final class FathaSongsScreenLoading extends FathaSongsScreenState {}
final class FathaSongsScreenFailure extends FathaSongsScreenState {
  final String errormsg;

  FathaSongsScreenFailure({required this.errormsg});
}