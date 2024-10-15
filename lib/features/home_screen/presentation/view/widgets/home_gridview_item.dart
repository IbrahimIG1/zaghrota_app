
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class HomeGridviewItem extends StatelessWidget {
  const HomeGridviewItem({super.key, required this.img, required this.title});
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
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:zaghrota_app/core/colors/colors.dart';
// import 'package:zaghrota_app/core/helper/get_current_lang.dart';
// import 'package:zaghrota_app/core/navigation/control_navigation.dart';
// import 'package:zaghrota_app/core/textstyles/textstyles.dart';

// class HomeListviewItem extends StatelessWidget {
//   const HomeListviewItem({super.key, required this.index, required this.listviewData, this.args});
//   final int index;
//   final List listviewData;
//   final dynamic args;

//   @override
//   Widget build(BuildContext context) {
    
//     return  Row(
                
//                 mainAxisAlignment:isArabic()? index%2==0? MainAxisAlignment.end:MainAxisAlignment.start:
//                 index%2==0? MainAxisAlignment.end:MainAxisAlignment.start,
//                children: [
//                 GestureDetector(
//                   onTap: () {
//                     ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context,arguments: args);
//                   },
//                   child: Stack(
//                     children: [
//                       SizedBox(
//                         width: 250.w,
//                         child:index%2==0?Image.asset("assets/images/polygons/Polygon 62.png",fit: BoxFit.fitWidth,):
//                         Image.asset("assets/images/polygons/Polygon 60.png",fit: BoxFit.fitWidth,)
//                         ),
//                       Padding(
//                         padding:  EdgeInsets.symmetric(vertical: 42.sp,
//                         horizontal:isArabic()? index%2==0?40.sp:30.sp:index%2==0?30.sp:40.sp),
//                         child: Center(
//                           child: CircleAvatar(
//                             radius: 90.w,
//                             backgroundColor: AppColors.scaffoldColor,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 SizedBox(
//                                   width: 100.sp,
//                                   child: Image.asset(listviewData[index]["image"],
//                                   fit: BoxFit.fitWidth,)),
//                                 Text(listviewData[index]["title"],style: Textstyles.listViewTitles,)
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 )
//                ],
//               );
//   }
// }