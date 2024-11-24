import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class BadlaItem extends StatelessWidget {
  const BadlaItem({super.key, required this.itemName, required this.checked, this.deleteOnPressed, this.checkOnChanged, this.onTapnav, required this.index});
  final String itemName;
  final bool checked;
  final void Function()? deleteOnPressed;
  final void Function(bool?)? checkOnChanged;
  final void Function()? onTapnav;
  final int index;

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.symmetric(vertical: 3.sp,horizontal: 5.sp),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.circleAvatarBorderColor)
              ),
              width: 1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width:index<17? 0.4.sw:0.65.sw,
                    child:Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Transform.scale(scale: 1.sp,child: Image.asset('assets/images/badlascreen_images/Chec_Mark.png'),),
                       HorizontalSizedBox(width: 3.w),
                       Container(
                        constraints: BoxConstraints(maxWidth:index<17? 0.33.sw:0.4.sw),
                        child: Text(itemName,style: Textstyles.nameOfInvitedPeopleStyle,))
                      ],
                    ) ,
                  ),
                   index<17? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.circleAvatarBorderColor
                    ),
                    onPressed: onTapnav, child: Text("عرض الصور",style:Textstyles.heartViewTextStyle.copyWith(color: AppColors.scaffoldColor) ,))
                    :const SizedBox(),
                     Checkbox(
                                     activeColor: AppColors.checkBoxActiveColor,
                                     checkColor: AppColors.checkBoxCheckColor,
                                     side: const BorderSide(color: AppColors.checkBoxActiveColor),
                                     value: checked,
                     
                                    onChanged:checkOnChanged
                                   ),
          IconButton(
          iconSize: 20.sp,
          onPressed:deleteOnPressed
          
          , icon: const Icon(
          
          Icons.delete,color: AppColors.circleAvatarBorderColor,))
                    
                ],
              ),
            );
  }
}