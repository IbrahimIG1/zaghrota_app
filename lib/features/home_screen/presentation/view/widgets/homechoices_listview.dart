import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class HomechoicesListview extends StatelessWidget {
  const HomechoicesListview({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String,List> listviewData  = {
      "titles":["قرأة الفاتحة","الشبكة","تجهيزات الفرح","الحنة","الفرح","شهر العسل"],
      "images":["assets/images/homepage_images/man's hand holding woman's hand.png",
      "assets/images/homepage_images/Wedding rings.png",
      "assets/images/homepage_images/wedding-couple-flat.png",
      "assets/images/homepage_images/Young joyful women.png",
      "assets/images/homepage_images/music festival.png",
      "assets/images/homepage_images/St Valentine Day Couple.png"
      ],
     };
    return  ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) =>Row(
              
              mainAxisAlignment: index%2==0? MainAxisAlignment.start:MainAxisAlignment.end,
             children: [
              Stack(
                children: [
                  SizedBox(
                    width: 250.w,
                    child:index%2==0?Image.asset("assets/images/polygons/Polygon 62.png",fit: BoxFit.fitWidth,):
                    Image.asset("assets/images/polygons/Polygon 60.png",fit: BoxFit.fitWidth,)
                    ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 40.sp,
                    horizontal:index%2==0?30.sp:40.sp),
                    child: Center(
                      child: CircleAvatar(
                        radius: 90.sp,
                        backgroundColor: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100.sp,
                              child: Image.asset(listviewData["images"]![index],
                              fit: BoxFit.fitWidth,)),
                            Text(listviewData["titles"]![index],style: Textstyles.listViewTitles,)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
             ],
            ),
            itemCount: listviewData["titles"]!.length,
            shrinkWrap: true,);
  }
}