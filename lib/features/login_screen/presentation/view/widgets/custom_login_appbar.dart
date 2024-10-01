import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';

class CustomLoginAppbar extends StatelessWidget {
  const CustomLoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    height: 42.h,
                    decoration: const BoxDecoration(
          // color: Colors.red,
          gradient: AppColors.appBarLinearColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            )
          
          )
                    );
  }
}