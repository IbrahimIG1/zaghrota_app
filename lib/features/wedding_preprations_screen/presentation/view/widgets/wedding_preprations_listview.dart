import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/widgets/wedding_prep_listview_item.dart';

class WeddingPreprationsListview extends StatelessWidget {
  const WeddingPreprationsListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
      {
      "title":"القاعات",
      "image":"assets/images/wedding_preprations_images/wedding_couple_flat_illustration_design.png",
      "navigation":"",
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
              
              itemBuilder: (context, index) => WeddingPrepListviewItem(index: index, listviewData: listviewData,args: args,),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}