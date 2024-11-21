import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/decoration_images_screen/data/repo/decoration_images_screen_repo.dart';
import 'package:zaghrota_app/features/dress_images_screen/data/model/dress_image_model.dart';

part 'decoration_images_state.dart';

class DecorationImagesCubit extends Cubit<DecorationImagesState> {
  DecorationImagesCubit() : super(DecorationImagesInitial());

  DecorationImagesScreenRepo repo = DecorationImagesScreenRepo();

    void getImages({required String type})async{
    emit(DecorationImagesLoading());

    var result = await repo.getImages(type:type);
    result.fold((l) {
      emit(DecorationImagesFailure(errorMsg: l.errormsg));
    }, 
    (r) {
      emit(DecorationImagesSuccess(images: r));
    },);
  }
}
