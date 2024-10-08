import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class VisitorItem extends StatelessWidget {
  const VisitorItem({super.key, required this.name, required this.numbersOfPeople, required this.checked, this.onChanged, this.onPressed});

 final String name;
 final int numbersOfPeople;
 final bool checked;
 final void Function(bool?)? onChanged;
 final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.circleAvatarBorderColor),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [SizedBox(
          width: 0.3.sw,
          child: Center(
            child: Text(name,
            style:Textstyles.nameOfInvitedPeopleStyle ,
            ),
          ),
        ),
       
      SizedBox(
        width: 0.3.sw ,
        child: Center(child: Text("$numbersOfPeople",style: Textstyles.nameOfInvitedPeopleStyle,)))
      ,
        SizedBox(
          width: 0.2.sw,
          child: Center(
            child: Transform.scale(
              scale: 1.2.sp,
              child: Checkbox(
                activeColor: AppColors.checkBoxActiveColor,
                checkColor: AppColors.checkBoxCheckColor,
                side: const BorderSide(color: AppColors.checkBoxActiveColor),
                value: checked,

               onChanged:onChanged,
              ),
            ),
          ),
        ),
        
        IconButton(
          iconSize: 20.sp,
          onPressed:onPressed
          
          , icon: const Icon(
          
          Icons.delete,color: AppColors.circleAvatarBorderColor,))
        ],
      ),
    );
  }
}