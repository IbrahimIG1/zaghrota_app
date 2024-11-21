import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/dress_images_screen/presentation/view/widgets/dress_images_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class DressImagesScreen extends StatelessWidget {
  const DressImagesScreen({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: const CustomAppBar(),
        body:SingleChildScrollView(
          child: DressImagesGridview(type: type,),
        ) ,
      ),
    );
  }
}