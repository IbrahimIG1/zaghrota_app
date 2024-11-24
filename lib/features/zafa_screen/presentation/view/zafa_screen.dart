import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/zafa_screen/presentation/view/widgets/zafa_gridview.dart';

class ZafaScreen extends StatelessWidget {
  const ZafaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: CustomAppBar(),
      body:ZafaGridview() ,
    ));
  }
}