import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class SongsTopTitlesItemView extends StatelessWidget {
  const SongsTopTitlesItemView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 3.r),
                    width: 0.3.sw,
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      border: Border.all(
                        color: AppColors.containerBorderColor,
                        width: 2,
                        style: BorderStyle.solid
                      ),
                      boxShadow: AppColors.containerShadowColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                      child: Text(title,
                      style: Textstyles.songsTopTitleStyle,
                      ),
                    )
                  ),
    );
  }
}