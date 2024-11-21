part of 'dress_images_cubit.dart';

@immutable
sealed class DressImagesState {}

final class DressImagesInitial extends DressImagesState {}
final class DressImagesLoading extends DressImagesState {}
final class DressImagesFailure extends DressImagesState {
  final String errorMsg;

  DressImagesFailure({required this.errorMsg});
}
final class DressImagesSuccess extends DressImagesState {
  final List<DressImageModel> images;

  DressImagesSuccess({required this.images}); 
}
