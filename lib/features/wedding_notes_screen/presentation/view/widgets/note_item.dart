import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.title, required this.content, required this.date, this.onDeletePressed});
  final String title;
  final String content;
  final DateTime date;
  final void Function()? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: 1.sw,
                // height: 0.6.sh,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.circleAvatarBorderColor),
                  borderRadius: BorderRadius.circular(25.r)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 3.sp,horizontal: 3.sp),
                      width: 0.3.sw,
                      decoration: BoxDecoration(
                        color: AppColors.circleAvatarBorderColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                          )
                      ),
                      child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeights.semiBold,overflow: TextOverflow.ellipsis),)),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
                      child: SizedBox(
                        // height: 0.23.sh,
                        child: Center(
                          child: Text(content,
                          style: Textstyles.blackStroke,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(onPressed:onDeletePressed , icon: Icon(Icons.delete,color: AppColors.checkBoxActiveColor,size: 25.sp,)),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    color: AppColors.scaffoldColor,
                    child: Text("${date.day}/${date.month}/${date.year}",style: Textstyles.darkTextStyle,textAlign: TextAlign.center,)
                    
                  ),
              )

      ],
    );
  }
}