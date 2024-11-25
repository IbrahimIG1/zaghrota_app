import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/ads_view/presentation/view/ads_view.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class Mo3asharajDo3a2Screen extends StatelessWidget {
  const Mo3asharajDo3a2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.sp,horizontal: 20.sp),
            child: Container(
              width: 1.sw,
              height: 0.5.sh,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColordo3a2),
                borderRadius: BorderRadius.circular(25.sp)
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.sp),
                    width: 0.4.sw,
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.only(
                        bottomLeft: Radius.circular(25.r),
                        bottomRight: Radius.circular(25.r)
                      ) ,
                      color: AppColors.borderColordo3a2
                    ),
                    child: Center(child: Text("المعاشرة",style: Textstyles.songsTopTitleStyle,)),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical:25.sp ),
                    child: Text("المعاشرة بين الزوجين في الإسلام يجب أن تكون قائمة على الاحترام والمودة، ويجب أن تكون برضا الطرفين دون إكراه. يمكن أن تبدأ الأمور باللطف والكلام الطيب والحنان لتقوية العلاقة بينهما.",
                    style: Textstyles.blackStroke,),
                  )
                ],
              ),
            
            ),
          ),
          AdsView()
        ],
      ),
    ));
  }
}