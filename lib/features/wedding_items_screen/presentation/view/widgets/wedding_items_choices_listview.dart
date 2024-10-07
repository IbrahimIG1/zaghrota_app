import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/helper/get_current_lang.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class WeddingItemsChoicesListview extends StatelessWidget {
  const WeddingItemsChoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData = [
      {
    "title":"الأغاني",
    "image":"assets/images/wedding_items_screen_images/music_player.png",
    "height":200.h,
    "width":200.w,
    "navigation":ScreenNames.songsScreen},
    {
    "title":"البوفية",
    "image":"assets/images/wedding_items_screen_images/buffet_breakfast.png",
    "height":200.h,
    "Width":200.w,
    "navigation":""
    },
    {
    "title":"المعازيم",
    "image":"assets/images/wedding_items_screen_images/Envelope_with_postcard_serpentine_ribbon_and_paper_bow_for_decorating_gifts.png",
    "height":200.h,
    "width":169.w,
    "navigation":ScreenNames.invitedPeopleScreen
    },
    {
    "title":"ديكورات",
    "image":"assets/images/wedding_items_screen_images/Christmas_decorations_and_snow_globe.png",
    "height":190.h,
    "width":190.w,
    "navigation":""
    },
    {
    "title":"نوتس",
    "image":"assets/images/wedding_items_screen_images/Taking_notes_with_pencil.png",
    "height":200.h,
    "width":200.w,
    "navigation":""
    },
    {
    "title":"تنبيهات",
    "image":"assets/images/wedding_items_screen_images/clock.png",
    "height":150.h,
    "width":150.w,
    "navigation":""
    },
    ];
    
    return SizedBox(
      height:0.56.sh ,
      child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 15.r,horizontal: 20.r),
              itemBuilder: (context, index) =>Align(
                alignment: isArabic()? index%2==0?AlignmentDirectional.centerEnd:AlignmentDirectional.centerStart :index%2==0?AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd ,
                child: GestureDetector(
                  onTap: () {
                    ControlNavigation().navigationToController(pageName: listviewData[index]["navigation"], context: context);
                  },
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
                                            width: listviewData[index]["width"],
                                            height: listviewData[index]["height"],
                                            decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage(listviewData[index]["image"]),fit: BoxFit.fill)
                                            ),
                                            ),
                                          Text(listviewData[index]["title"],style: Textstyles.listViewTitles,)
                                        ],
                                      ),
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