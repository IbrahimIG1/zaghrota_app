import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/do5la_screens/presentation/view/widgets/do5la_item.dart';

class Do5laGridview extends StatelessWidget {
  const Do5laGridview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData =[
       {
      "title":"النية الصالحة",
      "image":"assets/images/do5la_screen_images/neya.png",
      "navigation":ScreenNames.neyado3a2Screen
      
      },
      {
      "title":"الصلاة",
      "image":"assets/images/do5la_screen_images/sala.png",
      "navigation":ScreenNames.salado3a2Screen
      },
      {
      "title":"الدعاء",
      "image":"assets/images/do5la_screen_images/ad3ya.png",
      "navigation":ScreenNames.do3a2Screen
      },
      {
        "title":"المعاشرة",
      "image":"assets/images/do5la_screen_images/mo3asharah.png",
      "navigation":ScreenNames.mo3asharahdo3a2Screen
      },
      {
      "title":"دعاء قبل الجماع",
      "image":"assets/images/do5la_screen_images/do3a2.png",
      "navigation":ScreenNames.gema3do3a2Screen
      },
      {
        "title":"الاغتسال",
      "image":"assets/images/do5la_screen_images/dosh.png",
      "navigation":ScreenNames.e8tsaldo3a2Screen

      },
      
     ];
    return Padding(
    padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 15.sp),
    child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              mainAxisSpacing: 15.h,
              crossAxisSpacing: 10.w,
              crossAxisCount: 2),
           itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context);
            },
             child: Do5laItem(img: listviewData[index]["image"], title: listviewData[index]["title"])
           ),
           itemCount: listviewData.length,
           ),
        );
  }
}