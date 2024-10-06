import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class HomechoicesListview extends StatelessWidget {
  const HomechoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
      {
      "title":"قرأة الفاتحة",
      "image":"assets/images/homepage_images/man's_hand_holding_woman's_hand.png",
      "navigation":ScreenNames.weddingItemsScreen,
      
      },
      {
      "title":"الشبكة",
      "image":"assets/images/homepage_images/Wedding_rings.png",
      "navigation":""
      },
      {
      "title":"تجهيزات الفرح",
      "image":"assets/images/homepage_images/wedding_couple_flat.png",
      "navigation":ScreenNames.weddingPreprationsScreen
      },
      {
        "title":"الحنة",
      "image":"assets/images/homepage_images/Young_joyful_women.png",
      "navigation":""
      },
      {
      "title":"الفرح",
      "image":"assets/images/homepage_images/music_festival.png",
      "navigation":""
      },
      {
        "title":"شهر العسل",
      "image":"assets/images/homepage_images/St_Valentine_Day.png",
      "navigation":""

      }
    ];
     final args = ModalRoute.of(context)?.settings.arguments as DateTime;
    return  SizedBox(
      height:0.56.sh ,
      child: ListView.builder(
              
              itemBuilder: (context, index) =>Row(
                
                mainAxisAlignment: index%2==0? MainAxisAlignment.start:MainAxisAlignment.end,
               children: [
                GestureDetector(
                  onTap: () {
                    ControlNavigation().navigationToController(pageName: listviewData[index]["navigation"], context: context,arguments: args);
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 250.w,
                        child:index%2==0?Image.asset("assets/images/polygons/Polygon 62.png",fit: BoxFit.fitWidth,):
                        Image.asset("assets/images/polygons/Polygon 60.png",fit: BoxFit.fitWidth,)
                        ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 42.sp,
                        horizontal:index%2==0?30.sp:40.sp),
                        child: Center(
                          child: CircleAvatar(
                            radius: 90.w,
                            backgroundColor: AppColors.scaffoldColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 100.sp,
                                  child: Image.asset(listviewData[index]["image"],
                                  fit: BoxFit.fitWidth,)),
                                Text(listviewData[index]["title"],style: Textstyles.listViewTitles,)
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
               ],
              ),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}