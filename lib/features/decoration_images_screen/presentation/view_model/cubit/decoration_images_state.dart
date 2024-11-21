part of 'decoration_images_cubit.dart';

@immutable
sealed class DecorationImagesState {}

final class DecorationImagesInitial extends DecorationImagesState {}
final class DecorationImagesLoading extends DecorationImagesState {}
final class DecorationImagesFailure extends DecorationImagesState {
  final String errorMsg;

  DecorationImagesFailure({required this.errorMsg});
}
final class DecorationImagesSuccess extends DecorationImagesState {
  final List<DressImageModel> images;

  DecorationImagesSuccess({required this.images});

}
