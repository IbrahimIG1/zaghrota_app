import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/widgets/wedding_items_choices_listview.dart';

class WeddingItemsScreen extends StatelessWidget {
  const WeddingItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child:  Column(
          children: [
            CustomLoginAppbar(),
            // HeartDrawer(),
            WeddingItemsChoicesListview()
            
        
            
            
          ],
        ),
        ),
      ),
    );
  }
}