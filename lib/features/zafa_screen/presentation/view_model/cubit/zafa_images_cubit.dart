
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:zaghrota_app/features/zafa_screen/data/model/zafa_image_model.dart';
import 'package:zaghrota_app/features/zafa_screen/data/repos/zafa_images_screen_repo.dart';

part 'zafa_images_state.dart';

class ZafaImagesCubit extends Cubit<ZafaImagesState> {
  ZafaImagesCubit() : super(ZafaImagesInitial());
 ZafaImagesScreenRepo repo = ZafaImagesScreenRepo();
  void getImages()async{
    emit( ZafaImagesLoading());

    var result = await repo.getImages();
    result.fold((l) {
      emit( ZafaImagesFailure(errorMsg: l.errormsg));
    }, 
    (r) {
      emit( ZafaImagesSuccess(images: r));
    },);
  }
}
