import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/ka3at_screen/data/model/ka3a_model.dart';
import 'package:zaghrota_app/features/ka3at_screen/data/repo/ka3at_screen_repo.dart';

part 'get_ka3at_state.dart';

class Getka3aCubit extends Cubit<Getka3aState> {
  Getka3aCubit() : super(Getka3aInitial());
  Ka3atScreenRepo repo = Ka3atScreenRepo();

  void getKa3at({required String madinaId})async{
    var result = await repo.getKa3at(madinaId: madinaId);
    result.fold((l) {
      emit(Getka3aError(errorMsg: l.errormsg));
    }, (r) {
      emit(Getka3aSuccess(ka3at: r));
    },);

  }
}
