import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/dress_images_screen/data/model/dress_image_model.dart';
import 'package:zaghrota_app/features/dress_images_screen/data/repo/dress_image_screen_repo.dart';

part 'dress_images_state.dart';

class DressImagesCubit extends Cubit<DressImagesState> {
  DressImagesCubit() : super(DressImagesInitial());

   DressImageScreenRepo repo = DressImageScreenRepo();

  void getImages({required String type})async{
    emit(DressImagesLoading());

    var result = await repo.getImages(type:type);
    result.fold((l) {
      emit(DressImagesFailure(errorMsg: l.errormsg));
    }, 
    (r) {
      emit(DressImagesSuccess(images: r));
    },);
  }
}
