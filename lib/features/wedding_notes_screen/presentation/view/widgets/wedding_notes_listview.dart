import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/wedding_notes_screen/presentation/view/widgets/note_item.dart';

class WeddingNotesListview extends StatelessWidget {
  const WeddingNotesListview({super.key, required this.data, this.onDeletePressed});
  final List data;
  final void Function(int)? onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.9,
        crossAxisCount: 2,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 10.w
      ),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // separatorBuilder: (context, index) => const VerticalSizedBox(height: 10),
          padding: EdgeInsets.symmetric(horizontal: 10.sp,vertical: 10.sp),
          itemCount: data.length,
          
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              ControlNavigation.navigationToController(pageName: ScreenNames.noteDetails, context: context,arguments: {
               
                "title":data[index].title,
                "content":data[index].content
               
              });
            },
            child: NoteItem(
              onDeletePressed: (){
                onDeletePressed!(index);
              },
              title: data[index].title,
              content: data[index].content,
              date: DateTime.parse(data[index].date) ,
            
            ),
          )
          );
  }
}