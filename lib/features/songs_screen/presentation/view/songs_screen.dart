

import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_listview.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_top_titles_item_view.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar:CustomAppBar(),
      body: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SongsTopTitlesItemView(title: "اسم الأغنية",),
                SongsTopTitlesItemView(title: "ملحوظة"),
                SongsTopTitlesItemView(title: "ترتيب التشغيل"),

              ],
            ),
            SongsListview()
            
          ],
        ),
      ),
    ));
  }
}