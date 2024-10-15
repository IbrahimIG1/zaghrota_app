import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view/widgets/session_screen_gridview_item.dart';
import 'package:zaghrota_app/features/session_screen/presentation/view_model/cubit/session_screen_cubit.dart';

class SessionScreenGridviewBuilder extends StatelessWidget {
  const SessionScreenGridviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "img": "assets/images/session_screen_images/photographer.png",
        "title": "المصور"
      },
      {"img": "assets/images/session_screen_images/session_place.png",
       "title": "مكان السيشن"
       },
      {"img": "assets/images/session_screen_images/Man_lying.png",
       "title": "أوضاع التصوير"},
      {
        "img": "assets/images/session_screen_images/balloons.png",
        "title": "بالونات"
      },
      {
        "img": "assets/images/session_screen_images/flowers.png",
        "title": "زهور"
      },
      {"img": "assets/images/session_screen_images/woman_banner.png", "title": "لافتات أسماء"},
      {
        "img": "assets/images/session_screen_images/letter.png",
        "title": "حروف كبيرة"
      },
      {
        "img": "assets/images/session_screen_images/instagram.png",
        "title": "اطارات مزخرفة"
      },
      {"img": "assets/images/session_screen_images/umbrella.png", 
      "title": "مظلات"},
      {
        "img": "assets/images/session_screen_images/sofa_cushions.png",
        "title": "وسائد بألوان"
      },
      {
        "img": "assets/images/session_screen_images/prize.png",
        "title": "كاسات مزينة"
      },
      {
        "img": "assets/images/session_screen_images/bag.png",
        "title": "حقيبة صغيرة"
      },
      {
        "img": "assets/images/session_screen_images/facial_sheets.png",
        "title": "مناديل مبللة"
      },
      {
        "img": "assets/images/session_screen_images/girl.png",
        "title": "مرأة الجيب"
      },
      {
        "img": "assets/images/session_screen_images/perfume.png",
        "title": "عطر"
      },
      {
        "img": "assets/images/session_screen_images/transparent_glass.png",
        "title": "غطاء شفاف واقي",

      },
            {
        "img": "assets/images/session_screen_images/blanket.png",
        "title": "بطانيات صغيرة",
        
      },
            {
        "img": "assets/images/session_screen_images/glasses.png",
        "title": "نظارات شمسية",
        
      },
            {
        "img": "assets/images/session_screen_images/weshah.png",
        "title": "أوشحة",
        
      },
            {
        "img": "assets/images/session_screen_images/water_bottle.png",
        "title": "مياة",
        
      },
            {
        "img": "assets/images/session_screen_images/fan.png",
        "title": "مروحة العروسة",
        
      },
            {
        "img": "assets/images/session_screen_images/Man_and_woman.png",
        "title": "كراسي",
        
      },
    ];
    return BlocConsumer<SessionScreenCubit, SessionScreenState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
      if(state is SessionScreenSucess){

        var cubit = SessionScreenCubit.get(context);
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.sp),
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
              bool value = false;
              if (index<state.dataChecks.length){
                value = state.dataChecks[index];
              } 
              else{
                value =false;
                cubit.addData(value: value);
              }
              return SessionScreenGridviewItem(
              value: value,
              onChanged: (p0) {
                if(index<state.dataChecks.length){
                print(state.dataChecks.toString());

                cubit.updateCheckedValue(index: index, value: p0!);
                
               }
               else{
                print(state.dataChecks.length);
                print(index);
                cubit.addData(value:p0! );
               }
              },
              img: data[index]["img"],
              title: data[index]["title"],
            );},
            itemCount: data.length,
          ),
        );
      }
    else if(state is SessionScreenFailure){
      return Center(child: Text("error : ${state.errormsg}"),);
    }
    else{
      return const Center(child: CircularProgressIndicator(

        color: AppColors.circleAvatarBorderColor,
      ),);
    }
      },
    );
  }
}
