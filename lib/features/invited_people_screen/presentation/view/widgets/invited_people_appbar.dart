import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/visitor_item.dart';

class InvitedPeopleAppbar extends StatefulWidget implements PreferredSizeWidget {
  const InvitedPeopleAppbar({super.key});

  @override
  State<InvitedPeopleAppbar> createState() => _InvitedPeopleAppbarState();
  
  @override
  
  Size get preferredSize => Size.fromHeight(60.h);
}

class _InvitedPeopleAppbarState extends State<InvitedPeopleAppbar> {
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
                child: Text("عدد المعازيم : $numberOfComings",
                style:Textstyles.nOfInvitedPeopleStyle
                ),),
            ),
          ),
        )
        );
  }

}