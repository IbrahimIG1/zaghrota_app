import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/arosa_devices_screen/presentation/view/widgets/arosa_gridview_item.dart';

class ArosaDevicesGridview extends StatelessWidget {
  const ArosaDevicesGridview({super.key});

  @override
  Widget build(BuildContext context) {
      List data = [
      {
        "img":"assets/images/arosa_devices_image/Kitchenfood.png",
        "title":"المطبخ",
        "nav":ScreenNames.arosaDevicesKitchenScreen
      },
      {
        "img":"assets/images/arosa_devices_image/blue.png",
        "title":"الحمام",
        "nav":ScreenNames.arosaDevicesBathScreen
      },
      {
        "img":"assets/images/arosa_devices_image/bedroom.png",
        "title":"المفروشات",
        "nav":ScreenNames.arosaDevicesMafroshatScreen
      },
      {
        "img":"assets/images/arosa_devices_image/couple.png",
        "title":"شهر العسل",
         "nav":""
      },
      {
        "img":"assets/images/arosa_devices_image/clothes.png",
        "title":"الملابس",
        "nav":""
      },
      {
        "img":"assets/images/arosa_devices_image/socket.png",
        "title":"أجهزة كهربائية",
        "nav":""
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
             itemBuilder: (context, index) => GestureDetector(
              onTap:() {
                ControlNavigation.navigationToController(pageName: data[index]["nav"], context: context);
              } ,
              child: ArosaGridviewItem(img: data[index]["img"], title: data[index]["title"])),
             itemCount: data.length,
             ),
    );
  }
}