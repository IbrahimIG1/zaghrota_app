part of 'shabka_notes_screen_cubit.dart';

@immutable
sealed class ShabkaNotesScreenState {}

final class ShabkaNotesScreenInitial extends ShabkaNotesScreenState {}
final class ShabkaNotesScreenLoading extends ShabkaNotesScreenState {}
final class ShabkaNotesScreenSuccess extends ShabkaNotesScreenState {
  final List<NoteModel> notes;
  ShabkaNotesScreenSuccess({required this.notes});
}
final class ShabkaNotesScreenFailure extends ShabkaNotesScreenState {
  final String errormsg;

  ShabkaNotesScreenFailure({required this.errormsg});
  
}

