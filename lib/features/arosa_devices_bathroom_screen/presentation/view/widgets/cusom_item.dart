import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class CustomItem extends StatelessWidget {
  const CustomItem({super.key, required this.itemName, required this.checked, this.deleteOnPressed, this.checkOnChanged});
  final String itemName;
  final bool checked;
  final void Function()? deleteOnPressed;
  final void Function(bool?)? checkOnChanged;

  @override
  Widget build(BuildContext context) {
    return  Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 5.sp),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.circleAvatarBorderColor)
              ),
              width: 1.sw,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 0.5.sw,
                    child:Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Transform.scale(scale: 1.sp,child: Image.asset('assets/images/badlascreen_images/Chec_Mark.png'),),
                       HorizontalSizedBox(width: 10.sp),
                       Container(
                        constraints: BoxConstraints(maxWidth: 0.43.sw),
                        child: Text(itemName,style: Textstyles.nameOfInvitedPeopleStyle,))
                      ],
                    ) ,
                  ),
                  Text("x12",style: Textstyles.weddingNames,),
                     Checkbox(
                                    
                                     activeColor: AppColors.checkBoxActiveColor,
                                    //  checkColor: AppColors.checkBoxCheckColor,
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