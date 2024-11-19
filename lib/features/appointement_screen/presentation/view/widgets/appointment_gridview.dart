import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/appointement_screen/presentation/view/widgets/appointment_grid_item.dart';

class AppointmentGridview extends StatelessWidget {
  const AppointmentGridview({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "image":"assets/images/appointment_screen_images/flower.png",
        "title":"قراءة الفاتحه"
      },
      {
        "image":"assets/images/appointment_screen_images/ring.png",
        "title":"الخطوبه"
      },
      {
        "image":"assets/images/appointment_screen_images/cake.png",
        "title":"يوم الزفاف"
      },
      {
        "image":"assets/images/appointment_screen_images/ketab.png",
        "title":"كتب الكتاب"
      },
      {
        "image":"assets/images/appointment_screen_images/wife.png",
        "title":"الحناء"
      },
      {
        "image":"assets/images/appointment_screen_images/do5la.png",
        "title":"الدخله"
      },
      {
        "image":"assets/images/appointment_screen_images/3sl.png",
        "title":"شهر العسل"
      },
      {
        "image":"assets/images/appointment_screen_images/holidays.png",
        "title":"اول عيد معا"
      },
      {
        "image":"assets/images/appointment_screen_images/sanwy.png",
        "title":"الذكري السنويه للزواج"
      },
      {
        "image":"assets/images/appointment_screen_images/map_mosque.png",
        "title":"اول رمضان معا"
      },
    ];
    return GridView.builder(
        itemCount: data.length,
        padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 50.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 30.h,
          crossAxisSpacing: 35.w
        ),
         itemBuilder: (context, index) => AppointmentGridItem(
          image: data[index]["image"],
          title: data[index]["title"],
         ),) ;
  }
}