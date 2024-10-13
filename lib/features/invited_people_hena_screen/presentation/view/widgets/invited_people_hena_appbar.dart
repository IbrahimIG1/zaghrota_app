import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class InvitedPeopleHenaAppbar extends StatelessWidget implements PreferredSizeWidget {
  const InvitedPeopleHenaAppbar({super.key, required this.sumNum,});
  final int sumNum;
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
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient:  AppColors.appBarLinearColor
              ),
              child: Center(
                child: Text("عدد المعازيم : $sumNum",
                style:Textstyles.nOfInvitedPeopleStyle
                ),),
            ),
          ),
        )
        );
  }

  @override
  
  Size get preferredSize => Size.fromHeight(60.h);
}