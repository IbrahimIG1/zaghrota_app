import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/widgets/session_screen_gridview_item.dart';

class ClothesGridview extends StatelessWidget {
  const ClothesGridview({super.key});

  @override
  Widget build(BuildContext context) {
     List data = [
      {
        "img": "assets/images/clothes_devices_screen_images/omsanNom.png",
        "title": "قمصان النوم"
      },
      {"img": "assets/images/clothes_devices_screen_images/daily_clothes.png",
       "title": "الملابس اليومية"
       },
      {"img": "assets/images/clothes_devices_screen_images/home_occ.png",
       "title": "المناسبات المنزلية"},
      {
        "img": "assets/images/clothes_devices_screen_images/clot.png",
        "title": "داخلية يومية"
      },
      {
        "img": "assets/images/clothes_devices_screen_images/sport.png",
        "title": "رياضية"
      },
      {"img": "assets/images/clothes_devices_screen_images/harir.png", "title": "حرير"},
      {
        "img": "assets/images/clothes_devices_screen_images/rasmi.png",
        "title": "المناسابات الرسمية"
      },
      {
        "img": "assets/images/clothes_devices_screen_images/mshRsmi.png",
        "title": "خروج غير الرسمية"
      },
      {"img": "assets/images/clothes_devices_screen_images/shoes.png", 
      "title": "الأحذية"},
    ];
    return  Padding(
          padding:  EdgeInsets.only(top: 15.sp,bottom: 15.sp,right: 15.sp),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 2,
                // childAspectRatio: 0.7
                crossAxisSpacing: 0,
                mainAxisSpacing: 2.h),
            itemBuilder: (context, index) {
              return SessionScreenGridviewItem(
              value: false,
              onChanged: (p0) {
              
              },
              img: data[index]["img"],
              title: data[index]["title"],
            );},
            itemCount: data.length,
          ),
        );
  }
}