import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/mohafzat_screen/presentation/view/mohafzat_item.dart';

class MohafzatGridview extends StatelessWidget {
  const MohafzatGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20.sp),
          shrinkWrap: true,  
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.8,  
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h
          ),
          itemBuilder: (context, index) => MohafzatItem(
            onTap:() {
        ControlNavigation.navigationToController(pageName: ScreenNames.modnScreen, context: context);
      } ,

            location: "محافظة الغربية",
            index: index),
          itemCount: 5,
          
          );
  }
}