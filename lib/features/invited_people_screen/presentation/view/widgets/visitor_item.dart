import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class VisitorItem extends StatefulWidget {
  const VisitorItem({super.key, required this.index});
final int index;
  @override
  State<VisitorItem> createState() => _VisitorItemState();
}
List<bool> checked = List.generate(5, (index) => false,);
int numberOfComings=0;

class _VisitorItemState extends State<VisitorItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.circleAvatarBorderColor),
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text("محمد فوزي أبو شعيشع",
        style:Textstyles.nameOfInvitedPeopleStyle ,
        ),
        Text("x5",style: Textstyles.nameOfInvitedPeopleStyle,),
        Transform.scale(
          scale: 1.2.sp,
          child: Checkbox(
            activeColor: AppColors.checkBoxActiveColor,
            checkColor: AppColors.checkBoxCheckColor,
            side: const BorderSide(color: AppColors.checkBoxActiveColor),
            value: checked[widget.index],
           onChanged: (value) {
            // print("yeeeeeeeeeeeeeea");
            setState(() {
              checked[widget.index]=!checked[widget.index];
              if(checked[widget.index]){
              numberOfComings++;}
              else{
                numberOfComings--;
              }
            });
          },),
        )],
      ),
    );
  }
}