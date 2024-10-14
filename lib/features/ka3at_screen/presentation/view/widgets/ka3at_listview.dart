import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/ka3at_screen/presentation/view/widgets/ka3a_item.dart';

class Ka3atListview extends StatelessWidget {
  const Ka3atListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding:  EdgeInsets.symmetric(vertical: 25.sp),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => const VerticalSizedBox(height: 25),
            shrinkWrap: true,  
            itemBuilder: (context, index) =>const Ka3aItem(),
            itemCount: 5,),
          );
  }
}