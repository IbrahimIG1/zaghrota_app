
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/home_listview_item.dart';

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
      "navigation":ScreenNames.weddingItemsScreen
      },
      {
      "title":"تجهيزات الفرح",
      "image":"assets/images/homepage_images/wedding_couple_flat.png",
      "navigation":ScreenNames.weddingPreprationsScreen
      },
      {
        "title":"الحنة",
      "image":"assets/images/homepage_images/Young_joyful_women.png",
      "navigation":ScreenNames.weddingItemsScreen
      },
      {
      "title":"الفرح",
      "image":"assets/images/homepage_images/music_festival.png",
      "navigation":ScreenNames.weddingItemsScreen
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
              
              itemBuilder: (context, index) => HomeListviewItem(index: index, listviewData: listviewData,args: args,),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}
