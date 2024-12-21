import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/ads_helper/ads_helper.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/features/dress_images_screen/presentation/view/dress_images_screen.dart';
import 'package:zaghrota_app/features/dress_images_screen/presentation/view_model/cubit/dress_images_cubit.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/widgets/dress_screen_item.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view_model/cubit/dress_screen_cubit.dart';

class DressScreenGridviewBuilder extends StatelessWidget {
  const DressScreenGridviewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    List data = [
      {
        "img": "assets/images/dress_screen_images/dress2.png",
        "title": "فستان الزفاف"
        // yes
      },
     

      {"img": "assets/images/dress_screen_images/tarha.png", 
      "title": "الطرحة"
      // yes
      },
      {
        "img": "assets/images/dress_screen_images/queen.png",
        "title": "تاج او اكليل"
        // yes
      },
      {
        "img": "assets/images/dress_screen_images/forhair.png",
        "title": "مشبك للشعر"
        // yes
      },
      {"img": "assets/images/dress_screen_images/hands.png", 
      "title": "قفازات"
      //  yes
      },
      {
        "img": "assets/images/dress_screen_images/booling.png",
        "title": "أقراط"
        // yes
      },
      {
        "img": "assets/images/dress_screen_images/3o2d.png",
        "title": "عقد أو قلادة"
        // yes
      },
      {"img": "assets/images/dress_screen_images/asawer.png",
       "title": "سوار"
      //   yes
       },
      {
        "img": "assets/images/dress_screen_images/shoes.png",
        "title": "حذاء الزفاف"
        // yes
      },
      {
        "img": "assets/images/dress_screen_images/shoes2.png",
        "title": "حذاء مريح"
        //  yes
      },
     
    
      {
        "img": "assets/images/dress_screen_images/bag.png",
        "title": "حقيبة صغيرة"
        // yes
      },
      {
        "img": "assets/images/dress_screen_images/images_34.png",
        "title": "وشاح او شال"
        // yes
      },
      {
        "img": "assets/images/dress_screen_images/images_33.png",
        "title": "عطر خاص"
        // yes
      },
    ];
    return BlocConsumer<DressScreenCubit, DressScreenState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
      if(state is DressScreenSuccess){

        var cubit = DressScreenCubit.get(context);
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 25.sp),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 2,
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
              return GestureDetector(
                onTap: () {
                  AdsHelper().interstitialAdshow();
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BlocProvider(create: (context) => DressImagesCubit()..getImages(type: data[index]["title"]),
                  child: DressImagesScreen(type: data[index]["title"]),
                  ),));
                },
                child: DressScreenItem(
                value: value,
                onChanged: (p0) {
                  if(index<state.dataChecks.length){
                  cubit.updateCheckedValue(index: index, value: p0!);
                  
                 }
                 else{
                  cubit.addData(value:p0! );
                 }
                },
                img: data[index]["img"],
                title: data[index]["title"],
                            ),
              );},
            itemCount: data.length,
          ),
        );
      }
    else if(state is DressScreenFailure){
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
