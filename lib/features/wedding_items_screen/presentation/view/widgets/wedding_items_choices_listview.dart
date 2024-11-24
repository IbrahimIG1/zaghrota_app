import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/home_gridview_item.dart';

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
    "title":"المعازيم",
    "image":"assets/images/wedding_items_screen_images/Envelope_with_postcard_serpentine_ribbon_and_paper_bow_for_decorating_gifts.png",
    "height":200.h,
    "width":169.w,
    "navigation":ScreenNames.invitedPeopleScreen
    },
  
    {
    "title":"نوتس",
    "image":"assets/images/wedding_items_screen_images/Taking_notes_with_pencil.png",
    "height":200.h,
    "width":200.w,
    "navigation":ScreenNames.weddingNotesScreen
    },
  
    ];
    
    return SizedBox(
      // height:0.56.sh ,
      child: GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 10.w
              ) ,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 3.w),
              itemBuilder: (context, index) =>GestureDetector(
                onTap: () {
                  AdsHelper().interstitialAdshow();
                  ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context);
                },
                child:HomeGridviewItem(img: listviewData[index]["image"], 
                title: listviewData[index]["title"])
              ),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}