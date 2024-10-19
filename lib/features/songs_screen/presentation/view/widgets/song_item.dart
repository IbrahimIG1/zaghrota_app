import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/songs_screen/presentation/view/widgets/song_item_content.dart';


class SongItem extends StatelessWidget {
  const SongItem({super.key, required this.songName, required this.singerName, required this.note, this.deletePressed, this.editPressed});
 final String songName;
 final String singerName;
 final String note;
 final void Function()? deletePressed;
 final void Function()? editPressed;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.sp,vertical: 10.sp),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.sp,horizontal: 10.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black
          )
        ),
       child: Column(
        children: [
          SongItemContent(firstContent: "اسم الأغنية", secondContent: songName),
          const VerticalSizedBox(height: 10),
          SongItemContent(firstContent: "اسم المغني", secondContent: singerName),
          const VerticalSizedBox(height: 10),

          SongItemContent(firstContent: "ملحوظة", secondContent: note),
          const VerticalSizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.containerBackground
                ),
                onPressed:editPressed,
                 icon: Icon(Icons.edit,size: 20.sp,color: AppColors.scaffoldColor,)),
               IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.containerBackground
                ),
                onPressed: deletePressed,
                 icon: Icon(Icons.delete,size: 20.sp,color: AppColors.scaffoldColor,))
            ],
          )

          
        ],
       ),
      
      ),
    );
  }
}