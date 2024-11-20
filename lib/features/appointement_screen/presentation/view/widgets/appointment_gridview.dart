import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/features/appointment_view_screen/presentation/view/appointment_view_screen.dart';
import 'package:zaghrota_app/features/appointement_screen/presentation/view/widgets/appointment_grid_item.dart';
import 'package:zaghrota_app/features/appointment_view_screen/presentation/view_model/cubit/appointments_cubit.dart';

class AppointmentGridview extends StatelessWidget {
  const AppointmentGridview({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "image": "assets/images/appointment_screen_images/flower.png",
        "title": "كتب الكتاب",
        "type":"تاريخ مهم لكتب الكتاب"
      },
      {
        "image": "assets/images/appointment_screen_images/do5la.png",
        "title": "الدخله",
        "type":"تاريخ مهم لليلة الدخلة"
      },
      {
        "image": "assets/images/appointment_screen_images/3sl.png",
        "title": "شهر العسل",
        "type":"تاريخ مهم لشهر العسل"
      },
      {
        "image": "assets/images/appointment_screen_images/holidays.png",
        "title": "اول عيد معا",
        "type":"تاريخ مهم لاول عيد معا "
      },
      {
        "image": "assets/images/appointment_screen_images/sanwy.png",
        "title": "الذكري السنويه للزواج",
        "type":"تاريخ الذكري سنوية للزواج"
      },
      {
        "image": "assets/images/appointment_screen_images/map_mosque.png",
        "title": "اول رمضان معا",
        "type":"اول رمضان معا"
      },
    ];
    return GridView.builder(
      itemCount: data.length,
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.12.sh),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 30.h, crossAxisSpacing: 35.w),
      itemBuilder: (context, index) => AppointmentGridItem(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => AppointmentsCubit()..getdata(type:data[index]["type"],useLoading: true),
                  child:  AppointmentViewScreen(type:data[index]["type"],),
                ),
              ));
        },
        image: data[index]["image"],
        title: data[index]["title"],
      ),
    );
  }
}
