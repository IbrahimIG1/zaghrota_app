import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize:Size.fromHeight(60.h), 
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          child: AppBar(
            centerTitle: true,
            title: Text(title??"",style:Textstyles.nOfInvitedPeopleStyle.copyWith(fontWeight: FontWeights.extraBold ),),
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient:  AppColors.appBarLinearColor
              ),
            ),
          ),
        )
        );
  }
  
  @override
  
  Size get preferredSize => Size.fromHeight(60.h);
}