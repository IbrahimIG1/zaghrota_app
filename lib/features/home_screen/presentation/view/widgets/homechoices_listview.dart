import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class HomechoicesListview extends StatelessWidget {
  const HomechoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
      {
      "title":"قرأة الفاتحة",
      "image":"assets/images/homepage_images/man's hand holding woman's hand.png",
      "navigation":ScreenNames.weddingItemsScreen
      },
      {
      "title":"الشبكة",
      "image":"assets/images/homepage_images/Wedding rings.png",
      },
      {
      "title":"تجهيزات الفرح",
      "image":"assets/images/homepage_images/wedding-couple-flat.png",
      },
      {
        "title":"الحنة",
      "image":"assets/images/homepage_images/Young joyful women.png",
      },
      {
      "title":"الفرح",
      "image":"assets/images/homepage_images/music festival.png",
      },
      {
        "title":"شهر العسل",
      "image":"assets/images/homepage_images/St Valentine Day Couple.png",

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
                    Navigator.pushNamed(context, listviewData[index]["navigation"],arguments: args);
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 250.w,
                        child:index%2==0?Image.asset("assets/images/polygons/Polygon 62.png",fit: BoxFit.fitWidth,):
                        Image.asset("assets/images/polygons/Polygon 60.png",fit: BoxFit.fitWidth,)
                        ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 42.r,
                        horizontal:index%2==0?30.sp:40.sp),
                        child: Center(
                          child: CircleAvatar(
                            radius: 90.r,
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