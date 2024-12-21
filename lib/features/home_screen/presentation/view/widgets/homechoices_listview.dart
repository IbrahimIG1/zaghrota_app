
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/home_gridview_item.dart';


class HomechoicesListview extends StatelessWidget {
  const HomechoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
       {
      "title":"تجهيزات الفرح",
      "image":"assets/images/homepage_images/wedding_couple_flat.png",
      "navigation":ScreenNames.weddingPreprationsScreen
      },
      {
      "title":"قرأة الفاتحة",
      "image":"assets/images/homepage_images/man's_hand_holding_woman's_hand.png",
      "navigation":ScreenNames.fathacreen,
      
      },
      {
      "title":"الشبكة",
      "image":"assets/images/homepage_images/Wedding_rings.png",
      "navigation":ScreenNames.shabkaScreen
      },
     
      {
        "title":"الحنة",
      "image":"assets/images/homepage_images/Young_joyful_women.png",
      "navigation":ScreenNames.henaScreen
      },
      {
      "title":"الفرح",
      "image":"assets/images/homepage_images/music_festival.png",
      "navigation":ScreenNames.weddingItemsScreen
      },
      
      {
        "title":"شهر العسل",
      "image":"assets/images/homepage_images/St_Valentine_Day.png",
      "navigation":ScreenNames.arosaDevicesHoneymonthScreen

      },
       {
        "title":"ليلة الدخلة",
      "image":"assets/images/dress_screen_images/do5la.png",
      "navigation":ScreenNames.do5laScreen

      },
             {
        "title":"تواريخ هامه",
      "image":"assets/images/homepage_images/imp_hist.png",
      "navigation":ScreenNames.appointmentScreen
      },
    ];
    //  final args = ModalRoute.of(context)?.settings.arguments as DateTime;
    return  SizedBox(
      height:0.7.sh ,
      child:  Padding(
      padding: EdgeInsets.only(right: 5.w,left: 5.w,bottom: 20.h),
      child: GridView.builder(
              shrinkWrap: true,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.95,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 10.w,
                crossAxisCount: 2),
             itemBuilder: (context, index) => GestureDetector(
              onTap: () {
              
               if(listviewData[index]["title"]=="شهر العسل"){
                    AdsHelper().interstitialAdshow();
                ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context);

               }
               else{
                ControlNavigation.navigationToController(pageName: listviewData[index]["navigation"], context: context);

               }
              },
               child: HomeGridviewItem(
                img: listviewData[index]["image"], title: listviewData[index]["title"]),
             ),
             itemCount: listviewData.length,
             ),
    )
  
    );
  }
}
