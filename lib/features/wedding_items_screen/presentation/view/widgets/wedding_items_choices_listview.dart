import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class WeddingItemsChoicesListview extends StatelessWidget {
  const WeddingItemsChoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData = [
      {
    "Title":"الأغاني",
    "Image":"assets/images/wedding_items_screen_images/Retro cassette music player from the 90s.png",
    "Height":200.h,
    "Width":200.w},
    {
    "Title":"البوفية",
    "Image":"assets/images/wedding_items_screen_images/buffet breakfast.png",
    "Height":200.h,
    "Width":200.w},
    {
    "Title":"المعازيم",
    "Image":"assets/images/wedding_items_screen_images/Envelope with postcard, serpentine ribbon and paper bow for decorating gifts.png",
    "Height":200.h,
    "Width":169.w},
    {
    "Title":"ديكورات",
    "Image":"assets/images/wedding_items_screen_images/Christmas decorations and snow globe.png",
    "Height":190.h,
    "Width":190.w},
    {
    "Title":"نوتس",
    "Image":"assets/images/wedding_items_screen_images/Taking notes with a pencil.png",
    "Height":200.h,
    "Width":200.w},
    {
    "Title":"تنبيهات",
    "Image":"assets/images/wedding_items_screen_images/clock.png",
    "Height":150.h,
    "Width":150.w},
    ];
    
    return SizedBox(
      height:0.56.sh ,
      child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15.r,horizontal: 20.r),
              itemBuilder: (context, index) =>Align(
                alignment: index%2==0?AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd ,
                child: Container(
                  width: 0.7.sw,
                  height: 0.3.sh,
                  decoration: BoxDecoration(
                    
                    border: Border.all(color: AppColors.circleAvatarBorderColor),
                    shape: BoxShape.circle,
                    
                    
                  ),
                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: listviewData[index]["Width"],
                                          height: listviewData[index]["Height"],
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: AssetImage(listviewData[index]["Image"]),fit: BoxFit.fill)
                                          ),
                                          ),
                                        Text(listviewData[index]["Title"],style: Textstyles.listViewTitles,)
                                      ],
                                    ),
                )
                // CircleAvatar(
                //   radius: 100.sp,
                //   backgroundColor: AppColors.circleAvatarBorderColor,
                //   child: Center(
                //     child: CircleAvatar(
                //       radius: 99.sp,
                //      backgroundColor: Colors.white,
                //      child: Expanded(
                //        child: Center(
                //          child: Column(
                //           children: [
                //             Padding(
                //               padding:  EdgeInsets.symmetric(vertical: 30.r),
                //               child: Column(
                //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //                       crossAxisAlignment: CrossAxisAlignment.center,
                //                       children: [
                //                         SizedBox(
                //                           width: 100.sp,
                //                           child: Image.asset(listviewData["images"]![index],
                //                           fit: BoxFit.fitWidth,)),
                //                         Text(listviewData["titles"]![index],style: Textstyles.listViewTitles,)
                //                       ],
                //                     ),
                //             ),
                //           ],
                //          ),
                //        ),
                //      ),
                //     ),
                //   ),
                // ),
              ),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}