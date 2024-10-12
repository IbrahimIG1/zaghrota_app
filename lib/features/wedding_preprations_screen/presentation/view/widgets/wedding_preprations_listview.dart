import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/wedding_preprations_screen/presentation/view/widgets/wedding_prep_listview_item.dart';

class WeddingPreprationsListview extends StatelessWidget {
  const WeddingPreprationsListview({super.key});

  @override
  Widget build(BuildContext context) {
    List listviewData= [
      {
      "title":"القاعات",
      "image":"assets/images/wedding_preprations_images/wedding_couple_flat_illustration_design.png",
      "image2":"assets/images/advertisementpage_images/couple.png",
      "height":122.h,
      "width":141.w,
      "advImgHeight":300.h,
      "advImgWidth":323.w,
      "advSent":"افرحي يا عروسة وادفع يا عريس"
      },
      {
      "title":"فستان الفرح",
      "image":"assets/images/wedding_preprations_images/woman_in_wedding_dress_vector.png",
      "image2":"assets/images/advertisementpage_images/dress.png",
      "height":123.h,
      "width":100.w,
      "advImgHeight":330.h,
      "advImgWidth":300.w,
      "advSent":"افرحي يا عروسة وادفع يا عريس",
      "nav":ScreenNames.dressScreen
      },
      {
      "title":"البدلة",
      "image":"assets/images/wedding_preprations_images/images_10.png",
      "image2":"assets/images/advertisementpage_images/bdla.png",
      "height":104.h,
      "width":100.w,
      "advImgHeight":312.h,
      "advImgWidth":300.w,
      "advSent":"افرحي يا عروسة انا العريس",
      "nav":ScreenNames.bdlaScreen
      },
      {
        "title":"جهاز العروسة",
      "image":"assets/images/wedding_preprations_images/Kitchen_with_ovens_shelves_bowls.png",
      "image2":"assets/images/advertisementpage_images/kitchen.png",
      "height":100.h,
      "width":100.w,
      "advImgHeight":300.w,
      "advImgWidth":300.h,
      "advSent":"افرحي يا عروسة وكع يا بابا"
      },
      {
      "title":"السيشن",
      "image":"assets/images/wedding_preprations_images/download_5.png",
      "image2":"assets/images/advertisementpage_images/session.png",
      "height":106.h,
      "width":130.w,
      "advImgHeight":290.h,
      "advImgWidth":350.w,
      "advSent":"افرحي يا عروسة وادفع العريس"
      },
      {
        "title":"الزفة",
      "image":"assets/images/wedding_preprations_images/download_21.png",
      "image2":"assets/images/advertisementpage_images/zafa.png",
      "height":119.h,
      "width":130.w,
      "advImgHeight":300.h,
      "advImgWidth":326.w,
      "advSent":"افرحي يا عروسة وادفع يا عريس"

      }
    ];
    //  final args = ModalRoute.of(context)?.settings.arguments as DateTime;
    return  SizedBox(
      height:0.56.sh ,
      child: ListView.builder(
              
              itemBuilder: (context, index) => WeddingPrepListviewItem(index: index, listviewData: listviewData,
              ),
              itemCount: listviewData.length,
              shrinkWrap: true,),
    );
  }
}