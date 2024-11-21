part of 'zafa_images_cubit.dart';

@immutable
sealed class ZafaImagesState {}

final class ZafaImagesInitial extends ZafaImagesState {}
final class ZafaImagesLoading extends ZafaImagesState {}
final class ZafaImagesFailure extends ZafaImagesState {
  final String errorMsg;

  ZafaImagesFailure({required this.errorMsg});
  
}
final class ZafaImagesSuccess extends ZafaImagesState {
  final List<ZafaImageModel> images;

  ZafaImagesSuccess({required this.images});
}
