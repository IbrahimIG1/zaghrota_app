import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 10.sp),
            child: Container(
              width: 1.sw,
               decoration: BoxDecoration(
                  border: Border.all(color: AppColors.circleAvatarBorderColor),
                  borderRadius: BorderRadius.circular(25.r)
                ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.sp,vertical: 3.sp),
                    width: 0.5.sw,
                     decoration: BoxDecoration(
                          color: AppColors.circleAvatarBorderColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15.r),
                            bottomLeft: Radius.circular(15.r),
                            )
                        ),
                    child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeights.semiBold),))),
                  const VerticalSizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 20.sp),
                    child: Text(content,style: Textstyles.blackStroke,),
                  ),
                  const VerticalSizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}