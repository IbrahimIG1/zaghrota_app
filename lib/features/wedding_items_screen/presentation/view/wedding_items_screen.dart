import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/heart_drawer.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/widgets/wedding_items_choices_listview.dart';

class WeddingItemsScreen extends StatelessWidget {
  const WeddingItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child:  Column(
          children: [
            const CustomLoginAppbar(),
            const HeartDrawer(),
            WeddingItemsChoicesListview()
            
        
            
            
          ],
        ),
        ),
      ),
    );
  }
}