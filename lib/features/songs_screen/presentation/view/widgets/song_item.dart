import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item_content.dart';


class SongItem extends StatelessWidget {
  const SongItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black
          )
        ),
       child: const Column(
        children: [
          SongItemContent(firstContent: "اسم الأغنية", secondContent: "وانا بين ايدك"),
          VerticalSizedBox(height: 10),
          SongItemContent(firstContent: "اسم المغني", secondContent: "صابر الرباعي"),
          VerticalSizedBox(height: 10),

          SongItemContent(firstContent: "ملحوظة", secondContent: "رقصة سلوي"),
          VerticalSizedBox(height: 10),

          
        ],
       ),
      
      ),
    );
  }
}