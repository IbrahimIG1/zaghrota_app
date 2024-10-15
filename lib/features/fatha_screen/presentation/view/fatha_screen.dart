import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/fatha_screen/presentation/view/widgets/fatha_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class FathaScreen extends StatelessWidget {
  const FathaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: FathaListview()
        ),
    ));
  }
}