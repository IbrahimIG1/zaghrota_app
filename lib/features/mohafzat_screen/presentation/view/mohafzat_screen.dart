import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class MohafzatScreen extends StatelessWidget {
  const MohafzatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: MohafzatGridview()
        ) ,
      ));
  }
}