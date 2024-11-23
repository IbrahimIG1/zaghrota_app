import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/widgets/wedding_items_choices_listview.dart';

class WeddingItemsScreen extends StatelessWidget {
  const WeddingItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        appBar:  CustomAppBar(
              title: "الفرح",
            ),
        backgroundColor: AppColors.scaffoldColor,
        body: Center(child: WeddingItemsChoicesListview()),
      ),
    );
  }
}