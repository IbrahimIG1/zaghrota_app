import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/mohafzat_screen/data/model/mohafza_model.dart';
import 'package:zaghrota_app/features/mohafzat_screen/data/repos/mohafzat_screen_repo.dart';

part 'get_mohafza_state.dart';

class GetMohafzaCubit extends Cubit<GetMohafzaState> {
  GetMohafzaCubit() : super(GetMohafzaInitial());
  MohafzatScreenRepo repo = MohafzatScreenRepo();

  void getMohafzat()async{
    var result = await repo.getMohafzat();
    result.fold(
      (l) {
        emit(GetMohafzaFailure(errorMsg: l.errormsg));
      }
      , 
      (r) {
        emit(GetMohafzaSuccess(r));
      },
      );
  }
}
