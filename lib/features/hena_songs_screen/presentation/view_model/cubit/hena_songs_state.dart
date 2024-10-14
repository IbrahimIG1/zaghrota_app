part of 'hena_songs_cubit.dart';

@immutable
sealed class HenaSongsState {}

final class HenaSongsInitial extends HenaSongsState {}
final class HenaSongsScreenInitial extends HenaSongsInitial {}
final class HenaSongsScreenSuccess extends HenaSongsInitial {
  final List<SongModel> songs;

  HenaSongsScreenSuccess({required this.songs});
  
}
final class HenaSongsScreenLoading extends HenaSongsInitial {}
final class HenaSongsScreenFailure extends HenaSongsInitial {
  final String errormsg;

  HenaSongsScreenFailure({required this.errormsg});
  
}