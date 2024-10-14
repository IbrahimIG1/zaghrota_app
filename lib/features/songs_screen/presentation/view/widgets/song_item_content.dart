import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class SongItemContent extends StatelessWidget {
  const SongItemContent({super.key, required this.firstContent, required this.secondContent});
  final String firstContent;
  final String secondContent;


  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.sp,
                  horizontal: 10
                ),
                width: 0.3.sw,
                decoration: BoxDecoration(
                  color: AppColors.circleAvatarBorderColor,
                   border: Border.all(
                          color: AppColors.containerBackground,
                          width: 2,
                          style: BorderStyle.solid
                        ),
                        
                        borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text(firstContent,style: Textstyles.songsTopTitleStyle,)),
                
              ),
               Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5.sp,
                  horizontal: 10.sp
                ),
                width: 0.6.sw,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                   border: Border.all(
                          color: AppColors.containerBackground,
                          width: 2,
                          style: BorderStyle.solid
                        ),
                        
                        borderRadius: BorderRadius.circular(20)
                ),
                child: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(secondContent,style: Textstyles.songNameStyle,)),
                
              )
            ],
          );
  }
}