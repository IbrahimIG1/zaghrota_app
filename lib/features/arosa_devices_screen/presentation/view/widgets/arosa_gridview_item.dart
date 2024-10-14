import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class ArosaGridviewItem extends StatelessWidget {
  const ArosaGridviewItem({super.key, required this.img, required this.title});
 final String img;
 final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
            // width: 0.5.sw,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkPink)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(img))
                  ),
                ),
                Text(title,style: Textstyles.blackStroke,)
              ],
            ),
           );
  }
}