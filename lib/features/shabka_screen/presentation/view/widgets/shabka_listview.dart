import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/decoration_images_screen/presentation/view/decoration_images_screen.dart';
import 'package:zaghrota_app/features/decoration_images_screen/presentation/view_model/cubit/decoration_images_cubit.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/home_gridview_item.dart';

class ShabkaItemsChoicesListview extends StatelessWidget {
  const ShabkaItemsChoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData = [
      {
    "title":"الأغاني",
    "image":"assets/images/wedding_items_screen_images/music_player.png",
    "height":200.h,
    "width":200.w,
    "navigation":ScreenNames.shabkaSongsScreen},
   
    {
    "title":"المعازيم",
    "image":"assets/images/wedding_items_screen_images/Envelope_with_postcard_serpentine_ribbon_and_paper_bow_for_decorating_gifts.png",
    "height":200.h,
    "width":169.w,
    "navigation":ScreenNames.invitedPeopleShabkaScreen
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
    "navigation":ScreenNames.shabkaNotesScreen
    },
   
    ];
    
    return SizedBox(
      // height:0.56.sh ,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 10.w
        ),
              
              padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 5.w),
              itemBuilder: (context, index) =>GestureDetector(
                onTap:index==2? (){
                  AdsHelper().interstitialAdshow();
                   Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlocProvider(
                            create: (context) => DecorationImagesCubit()..getImages(type: "الشبكة"),
                            child: const DecorationImagesScreen(
                                type: "الشبكة"),
                          ),
                        ));
                }:() {
                  AdsHelper().interstitialAdshow();
                  ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context);
                },
                child: HomeGridviewItem(img: listviewData[index]["image"], 
                title: listviewData[index]["title"])
              ),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}