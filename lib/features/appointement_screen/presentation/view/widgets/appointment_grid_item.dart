import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class AppointmentGridItem extends StatelessWidget {
  const AppointmentGridItem({super.key, required this.image, required this.title, this.onTap});
 final String image;
 final String title;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap:onTap ,
      child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(
                color: AppColors.specialPink
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Transform.scale(
                  scale: 1.03.sp,
                  child: Image.asset(image)),
                Text(title,style:Textstyles.blackStroke.copyWith(fontSize: 13.sp),)
      
              ],
            ),
           ),
    );
  }
}