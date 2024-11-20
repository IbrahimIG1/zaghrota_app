import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/badla_images_screen/presentation/view/widgets/badla_images_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class BadlaImagesScreen extends StatelessWidget {
  const BadlaImagesScreen({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: const CustomAppBar(),
      body: BadlaImagesGridview(type:type ,),
    ));
  }
}