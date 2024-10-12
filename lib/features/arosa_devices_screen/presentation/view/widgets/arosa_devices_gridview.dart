import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/widgets/arosa_gridview_item.dart';

class ArosaDevicesGridview extends StatelessWidget {
  const ArosaDevicesGridview({super.key});

  @override
  Widget build(BuildContext context) {
      List data = [
      {
        "img":"assets/images/arosa_devices_image/Kitchenfood.png",
        "title":"المطبخ"
      },
      {
        "img":"assets/images/arosa_devices_image/blue.png",
        "title":"الحمام"
      },
      {
        "img":"assets/images/arosa_devices_image/bedroom.png",
        "title":"المفروشات"
      },
      {
        "img":"assets/images/arosa_devices_image/couple.png",
        "title":"شهر العسل"
      },
      {
        "img":"assets/images/arosa_devices_image/clothes.png",
        "title":"الملابس"
      },
      {
        "img":"assets/images/arosa_devices_image/socket.png",
        "title":"أجهزة كهربائية"
      },
    ];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 15.sp),
      child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.9,
                mainAxisSpacing: 15.h,
                crossAxisSpacing: 10.w,
                crossAxisCount: 2),
             itemBuilder: (context, index) => ArosaGridviewItem(img: data[index]["img"], title: data[index]["title"]),
             itemCount: data.length,
             ),
    );
  }
}