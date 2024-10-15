import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/mohafazat_modn_screen/presentation/view/widgets/modn_gridview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class MohafzatModnScreen extends StatelessWidget {
  const MohafzatModnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: ModnGridview()
        ) ,
      ));
  }
}