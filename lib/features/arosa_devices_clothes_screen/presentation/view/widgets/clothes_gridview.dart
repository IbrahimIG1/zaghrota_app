import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/arosa_devices_clothes_screen/presentation/view_model/cubit/clothes_screen_cubit.dart';
import 'package:zaghrota_app/features/dress_screen/presentation/view/widgets/dress_screen_item.dart';

class ClothesGridview extends StatelessWidget {
  const ClothesGridview({super.key});

  @override
  Widget build(BuildContext context) {
     List data = [
      {
        "img": "assets/images/clothes_devices_screen_images/omsanNom.png",
        "title": "قمصان النوم",
        "nav":ScreenNames.arosaDevicesNoomClothesScreen
      },
      {"img": "assets/images/clothes_devices_screen_images/daily_clothes.png",
       "title": "الملابس اليومية",
       "nav":ScreenNames.arosaDevicesDailyClothesScreen

       },
      {"img": "assets/images/clothes_devices_screen_images/home_occ.png",
       "title": "المناسبات المنزلية",
       "nav":ScreenNames.arosaDevicesHomeClothesScreen
       },
      {
        "img": "assets/images/clothes_devices_screen_images/clot.png",
        "title": "داخلية يومية",
        "nav":ScreenNames.arosaDevicesCentianClothesScreen
      },
      {
        "img": "assets/images/clothes_devices_screen_images/sport.png",
        "title": "رياضية",
        "nav":ScreenNames.arosaDevicesSportsClothesScreen
      },
      {"img": "assets/images/clothes_devices_screen_images/harir.png", "title": "حرير",
      "nav":ScreenNames.arosaDevicesHarirClothesScreen},
      {
        "img": "assets/images/clothes_devices_screen_images/rasmi.png",
        "title": "المناسابات الرسمية",
        "nav":ScreenNames.arosaDevicesFormalClothesScreen
      },
      {
        "img": "assets/images/clothes_devices_screen_images/mshRsmi.png",
        "title": "خروج غير الرسمية",
        "nav":ScreenNames.arosaDevicesUnFormalClothesScreen
      },
       {
        "img": "assets/images/clothes_devices_screen_images/accessories.png",
        "title": "الاكسسوارات",
        "nav":ScreenNames.arosaDevicesAccessoriesScreen
      },
      {"img": "assets/images/clothes_devices_screen_images/shoes.png", 
      "title": "الأحذية",
      "nav":ScreenNames.arosaDevicesShoesScreen
      },
       {
        "img": "assets/images/clothes_devices_screen_images/ra2s.png",
        "title": "بدل الرقص",
        "nav":ScreenNames.arosaDevicesR2sScreen
      },
    ];
     return BlocConsumer<ClothesScreenCubit, ClothesScreenState>(
      listener: (context, state) {
       
      },
      builder: (context, state) {
      if(state is ClothesScreenSuccess){

        var cubit = ClothesScreenCubit.get(context);
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
              return GestureDetector(
                onTap: () {
                  ControlNavigation.navigationToController(pageName:data[index]["nav"] , context: context);
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
    else if(state is ClothesScreenFailure){
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