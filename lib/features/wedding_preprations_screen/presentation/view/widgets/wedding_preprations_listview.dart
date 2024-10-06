import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class WeddingPreprationsListview extends StatelessWidget {
  const WeddingPreprationsListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
      {
      "title":"القاعات",
      "image":"assets/images/wedding_preprations_images/wedding_couple_flat_illustration_design.png",
      "navigation":ScreenNames.weddingItemsScreen,
      "height":122.h,
      "width":141.w
      },
      {
      "title":"فستان الفرح",
      "image":"assets/images/wedding_preprations_images/woman_in_wedding_dress_vector.png",
      "height":123.h,
      "width":100.w,
      "navigation":""
      },
      {
      "title":"البدلة",
      "image":"assets/images/wedding_preprations_images/images_10.png",
      "height":104.h,
      "width":100.w,
      "navigation":""
      },
      {
        "title":"جهاز العروسة",
      "image":"assets/images/wedding_preprations_images/Kitchen_with_ovens_shelves_bowls.png",
      "height":100.h,
      "width":100.w,
      "navigation":""
      },
      {
      "title":"السيشن",
      "image":"assets/images/wedding_preprations_images/download_5.png",
      "height":106.h,
      "width":130.w,
      "navigation":""
      },
      {
        "title":"الزفة",
      "image":"assets/images/wedding_preprations_images/download_21.png",
      "height":119.h,
      "width":130.w,
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
                        Image.asset("assets/images/polygons/Polygon 60.png",fit: BoxFit.fill,)
                        ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 42.sp,
                        horizontal:index%2==0?20.sp:40.sp),
                        child: Center(
                          child: CircleAvatar(
                            radius: 90.w,
                            backgroundColor: AppColors.scaffoldColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: listviewData[index]["width"],
                        height: listviewData[index]["heigt"],
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