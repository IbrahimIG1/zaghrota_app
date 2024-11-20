import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/badla_images_screen/data/model/badla_image_model.dart';
import 'package:zaghrota_app/features/badla_images_screen/data/repo/badla_images_screen_repo.dart';

part 'badla_images_state.dart';

class BadlaImagesCubit extends Cubit<BadlaImagesState> {
  BadlaImagesCubit() : super(BadlaImagesInitial());
  BadlaImagesScreenRepo repo = BadlaImagesScreenRepo();

  void getImages({required String type})async{
    emit(BadlaImagesLoading());

    var result = await repo.getImages(type:type);
    result.fold((l) {
      emit(BadlaImagesFailure(errorMsg: l.errormsg));
    }, 
    (r) {
      emit(BadlaImagesSuccess(images: r));
    },);
  }
}
