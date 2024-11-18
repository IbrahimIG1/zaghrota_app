import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/data/model/madina_model.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/data/repo/modn_screen_repo.dart';

part 'get_modn_state.dart';

class GetModnCubit extends Cubit<GetModnState> {
  GetModnCubit() : super(GetModnInitial());
  ModnScreenRepo repo = ModnScreenRepo();

  void getModn({required String mohafzaId})async{
   var result = await repo.getModn(mohafzaId: mohafzaId);

   result.fold((l) {
     emit(GetModnError(errorMsg: l.errormsg));
   }, (r) {
     emit(GetModnSuccess(modn: r));
   },);
  }
}
