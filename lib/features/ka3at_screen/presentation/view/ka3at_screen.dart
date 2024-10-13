import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view/widgets/ka3at_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class Ka3atScreen extends StatelessWidget {
  const Ka3atScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Ka3atListview()
        ),
      ),
    );
  }
}