part of 'badla_images_cubit.dart';

@immutable
sealed class BadlaImagesState {}

final class BadlaImagesInitial extends BadlaImagesState {}
final class BadlaImagesLoading extends BadlaImagesState {}
final class BadlaImagesFailure extends BadlaImagesState {
  final String errorMsg;

  BadlaImagesFailure({required this.errorMsg});
}
final class BadlaImagesSuccess extends BadlaImagesState {

  final List<BadlaImageModel> images;

  BadlaImagesSuccess({required this.images});
}
