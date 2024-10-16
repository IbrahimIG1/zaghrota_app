import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_screen/presentation/view/widgets/clothes_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class ArosaDevicesClothesScreen extends StatelessWidget {
  const ArosaDevicesClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body:SingleChildScrollView(
        child:ClothesGridview() ,
      ) ,
    ));
  }
}