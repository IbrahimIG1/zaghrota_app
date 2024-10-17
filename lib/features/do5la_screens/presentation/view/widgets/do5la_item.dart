import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/helper/get_current_lang.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';

class Do5laItem extends StatelessWidget {
  const Do5laItem({super.key, required this.img, required this.title});
final String img;
final String title;
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      children: [
        Padding(
          padding: isArabic()? EdgeInsets.only(left: 0.sp):EdgeInsets.only(right: 0.sp),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: .5.sw,
            height: 0.2.sh,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.circleAvatarBorderColor),
                shape: BoxShape.circle),
            child: Container(
              decoration: BoxDecoration(
                  
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        img,
                      ))),
            ),
          ),
        ),
        //  Container(),
        const VerticalSizedBox(height: 5),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.sp, horizontal: 2.sp),
          width: 0.3.sw,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.sp),
              color: const Color.fromARGB(220, 216, 0, 115)),
          child: Center(
              child: Text(
              title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeights.thin,
                fontSize: 12.sp),
          )),
        ),
      ],
    );
  }
}