import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/invited_people_appbar.dart';
import 'package:zaghrota_app/features/invited_people_screen/presentation/view/widgets/invited_people_listview.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/songs_top_titles_item_view.dart';

class InvitedPeopleScreen extends StatelessWidget {
  const InvitedPeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
      floatingActionButton: FloatingActionButton(
        
        backgroundColor: AppColors.circleAvatarBorderColor,
        onPressed: () {
            showDialog(context: context, 
            builder: (context) => AlertDialog(
              
              title: Center(child: Text("بيانات المعزوم",style: Textstyles.nameOfInvitedPeopleStyle,)),
              backgroundColor: AppColors.scaffoldColor,
              content:Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               const Customtextfield(hintText: "اسم المعزوم", useStyle2: false),
               const VerticalSizedBox(height: 15),
               const Customtextfield(hintText: "عدد المعزومين", useStyle2: false),
               const VerticalSizedBox(height: 15),
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.circleAvatarBorderColor
                ),
                onPressed: () {
                 
               }, child: Text("اضافة",style: Textstyles.songsTopTitleStyle,))
              ],
            ),
            ) );
            
            
      },
       child: Icon(Icons.add,size: 20.sp,color: Colors.white,)),
     appBar: const InvitedPeopleAppbar(),
     body: const SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             SongsTopTitlesItemView(title: "اسم المدعو"),
             SongsTopTitlesItemView(title: "عدد التابعين"),
             SongsTopTitlesItemView(title: "تأكيد الحضور"),
            ],
            
          ),
        InvitedPeopleListview()  
        ],
        
      ),
     ),
    ));
  }
}