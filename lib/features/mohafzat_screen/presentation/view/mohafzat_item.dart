import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class MohafzatItem extends StatelessWidget {
  const MohafzatItem({super.key, required this.index});
 final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },
      child: ClipRRect(
              
              borderRadius: BorderRadius.circular(15.sp),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(20.sp),
                  border: Border(
                    left: BorderSide(width: 12.sp,color: index%2==0? AppColors.darkViolet:AppColors.darkBlue),
                    top: BorderSide(width: 12.sp,color: index%2==0? AppColors.darkViolet:AppColors.darkBlue),
                    right: BorderSide(width: 4.sp,color: index%2==0? AppColors.darkViolet:AppColors.darkBlue),
                    bottom: BorderSide(width: 4.sp,color: index%2==0? AppColors.darkViolet:AppColors.darkBlue)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(image: const AssetImage("assets/images/mohafzat_screen_images/ka3a.png"),width: 0.4.sw,
                    height: 0.2.sh,
                    ),
                    Text("محافظة الغربية",style: Textstyles.blackStroke,)
                  ],
                ),
              ),
            ),
    );
  }
}