part of 'wedding_notes_screen_cubit.dart';

@immutable
sealed class WeddingNotesScreenState {}

final class WeddingNotesScreenInitial extends WeddingNotesScreenState {}
final class WeddingNotesScreenLoading extends WeddingNotesScreenState {}
final class WeddingNotesScreenSuccess extends WeddingNotesScreenState {
  final List<NoteModel> notes;
  WeddingNotesScreenSuccess({required this.notes});
}
final class WeddingNotesScreenFailure extends WeddingNotesScreenState {
  final String errormsg;

  WeddingNotesScreenFailure({required this.errormsg});
  
}
