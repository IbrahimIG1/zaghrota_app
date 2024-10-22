part of 'hena_notes_screen_cubit.dart';

@immutable
sealed class HenaNotesScreenState {}

final class HenaNotesScreenInitial extends HenaNotesScreenState {}
final class HenaNotesScreenLoading extends HenaNotesScreenState {}
final class HenaNotesScreenSuccess extends HenaNotesScreenState {
  final List<NoteModel> notes;
  HenaNotesScreenSuccess({required this.notes});
}
final class HenaNotesScreenFailure extends HenaNotesScreenState {
  final String errormsg;

  HenaNotesScreenFailure({required this.errormsg});
  
}

