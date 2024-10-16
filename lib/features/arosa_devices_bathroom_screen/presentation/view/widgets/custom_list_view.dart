import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/data/model/devices_model.dart';
import 'package:zaghrota_app/features/arosa_devices_bathroom_screen/presentation/view/widgets/cusom_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, this.checkOnChanged, this.deleteOnPressed, required this.data});
  final void Function(bool?,int)? checkOnChanged;
  final void Function(int)? deleteOnPressed;
  final List<DevicesModel> data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 10.sp),
      child: ListView.separated(
        separatorBuilder: (context, index) => const VerticalSizedBox(height: 10),
        shrinkWrap: true,
        itemCount: data.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => CustomItem(
          checkOnChanged:(p0){
            checkOnChanged!(p0,index);
          } ,
          deleteOnPressed:() {
            deleteOnPressed!(index);
          } ,
          itemName: data[index].deviceName, 
          checked: data[index].checked),),
    );
  }
}