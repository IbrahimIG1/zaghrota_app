import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/helper/get_current_lang.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class WeddingPrepListviewItem extends StatelessWidget {
  const WeddingPrepListviewItem({
    super.key,
    required this.index, 
    required this.listviewData,
    // required this.advHeight, 
    // required this.advWidth,
    // required this.advImgpath,
    // required this.advSent,
    // required this.advNavpageName
    });

  final int index;
  final List listviewData;
  // final double advHeight;
  // final double advWidth;
  // final String advImgpath;
  // final String advSent;
  // final String advNavpageName;
  @override
  Widget build(BuildContext context) {
    return Row(
                
                mainAxisAlignment: isArabic()? index%2==0? MainAxisAlignment.end:MainAxisAlignment.start:
                index%2==0? MainAxisAlignment.end:MainAxisAlignment.start,
               children: [
                GestureDetector(
                  onTap: () {
                    
                  ControlNavigation.navigationToController(pageName: ScreenNames.advertisementScreen, context: context,
                  arguments:{
                    "height":listviewData[index]["advImgHeight"],
                    "width":listviewData[index]["advImgWidth"],
                    'imagePath':listviewData[index]["image2"],
                    "pageSentence":listviewData[index]["advSent"],
                    "pageName":listviewData[index]["nav"]} );

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
                        horizontal:isArabic()? index%2==0?40.sp:30.sp:index%2==0?30.sp:40.sp),
                        child: Center(
                          child: CircleAvatar(
                            radius: 90.w,
                            backgroundColor: AppColors.scaffoldColor,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: listviewData[index]["width"],
                        height: listviewData[index]["height"],
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
              );
  }
}