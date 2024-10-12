import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/helper/get_current_lang.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';

class DressScreenItem extends StatelessWidget {
  const DressScreenItem({super.key, required this.img, required this.title, this.value, this.onChanged});
final String img;
final String title;
final bool? value;
final void Function(bool?)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: isArabic()? EdgeInsets.only(left: 30.sp):EdgeInsets.only(right: 30.sp),
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
        // const VerticalSizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Checkbox(
               
                value: value,
                onChanged: onChanged,
                activeColor: AppColors.checkBoxActiveColor,
                checkColor: AppColors.checkBoxCheckColor,
                side: const BorderSide(color: AppColors.checkBoxActiveColor),
              ),
          ],
        ),
      ],
    );
  }
}
