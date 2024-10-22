part of 'fatha_notes_screen_cubit.dart';

@immutable
sealed class FathaNotesScreenState {}

final class FathaNotesScreenInitial extends FathaNotesScreenState {}
final class FathaNotesScreenLoading extends FathaNotesScreenState {}
final class FathaNotesScreenSuccess extends FathaNotesScreenState {
  final List<NoteModel> notes;
  FathaNotesScreenSuccess({required this.notes});
}
final class FathaNotesScreenFailure extends FathaNotesScreenState {
  final String errormsg;

  FathaNotesScreenFailure({required this.errormsg});
  
}

