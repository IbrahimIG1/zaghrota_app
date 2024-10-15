import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/cusom_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.deleteOnPressed});
 final Function(int) deleteOnPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 10.sp),
      child: ListView.separated(
        separatorBuilder: (context, index) => const VerticalSizedBox(height: 10),
        shrinkWrap: true,
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => CustomItem(itemName: "طقم دواسات", checked: false,
        deleteOnPressed: () {
          deleteOnPressed(index);
        },),),
    );
  }
}