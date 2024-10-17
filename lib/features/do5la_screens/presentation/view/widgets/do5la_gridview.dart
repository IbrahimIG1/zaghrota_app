import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/features/do5la_screens/presentation/view/widgets/do5la_item.dart';

class Do5laGridview extends StatelessWidget {
  const Do5laGridview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData =[
       {
      "title":"النية الصالحة",
      "image":"assets/images/do5la_screen_images/neya.png",
      "navigation":""
      
      },
      {
      "title":"الصلاة",
      "image":"assets/images/do5la_screen_images/sala.png",
      "navigation":""
      },
      {
      "title":"الدعاء",
      "image":"assets/images/do5la_screen_images/ad3ya.png",
      "navigation":""
      },
      {
        "title":"المعاشرة",
      "image":"assets/images/do5la_screen_images/mo3asharah.png",
      "navigation":""
      },
      {
      "title":"دعاء قبل الجماع",
      "image":"assets/images/do5la_screen_images/do3a2.png",
      "navigation":""
      },
      {
        "title":"الاغتسال",
      "image":"assets/images/do5la_screen_images/dosh.png",
      "navigation":""

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