import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/heart_drawer.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/homechoices_listview.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CustomLoginAppbar(),
            HeartDrawer(),
            
            HomechoicesListview()
        
            
            
          ],
        ),
      ),
    ));
  }
}

