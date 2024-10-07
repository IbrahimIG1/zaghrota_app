import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/visitor_item.dart';

class InvitedPeopleListview extends StatelessWidget {
  const InvitedPeopleListview({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp),
              child: VisitorItem(index: index,)) , 
            separatorBuilder:(context, index) => const VerticalSizedBox(height: 10), 
            itemCount: 5);
  }
}