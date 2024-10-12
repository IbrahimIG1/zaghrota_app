import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/widgets/wedding_preprations_listview.dart';


class WeddingPreprationsScreen extends StatelessWidget {
  const WeddingPreprationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
       backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child:  Column(
          children: [
             CustomLoginAppbar(),
            //  HeartDrawer(),
            WeddingPreprationsListview()
            
        
            
            
          ],
        ),
        ),
      )
      );
  }
}