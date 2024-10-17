import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/do5la_screens/presentation/view/widgets/do5la_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class Do5laScreen extends StatelessWidget {
  const Do5laScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Do5laGridview(),
      ),
    ));
  }
}