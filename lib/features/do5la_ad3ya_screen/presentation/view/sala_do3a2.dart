import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/custom_app_bar.dart';

class SalaDo3a2Screen extends StatelessWidget {
  const SalaDo3a2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 35.sp,horizontal: 20.sp),
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
                  child: Center(child: Text("الصلاة",style: Textstyles.songsTopTitleStyle,)),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.sp,vertical:25.sp ),
                  child: Text("يُستحب أن يبدأ الزوجان بالصلاة ركعتين معًا ليلة الدخلة، حيث يُعتبر ذلك من السنة. الصلاة في هذه اللحظة تؤدي إلى بداية الحياة الزوجية بالبركة والتقرب إلى الله.",
                  style: Textstyles.blackStroke,),
                )
              ],
            ),
          
          ),
        ),
      ),
    ));
  }
}