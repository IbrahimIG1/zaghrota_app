import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';

class AddNoteDataDialogue extends StatelessWidget {
  const AddNoteDataDialogue({
    super.key,
    required this.formKey,
    required this.onChanged,
    required this.addData, this.titleNotecontroller, this.contentNotecontroller,
  });

  final GlobalKey<FormState> formKey;
  final void Function(String) onChanged;
  final TextEditingController? titleNotecontroller;
  final TextEditingController? contentNotecontroller;
  
  final Function addData; 
  
  @override
  Widget build(context) {
    return FloatingActionButton(
        backgroundColor: AppColors.circleAvatarBorderColor,
        onPressed: () {
          songDataDialog(context);
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: Colors.white,
        ));
  }

  void songDataDialog(BuildContext context,) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text(
                "بيانات الأغنية",
                style: Textstyles.nameOfInvitedPeopleStyle,
              )),
              backgroundColor: AppColors.scaffoldColor,
              content: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customtextfield(
                        controller: titleNotecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك أدخل العنوان";
                          }
                          return null;
                        },
                        // onChanged: (p0) {
                        // onChanged(p0);
                        // },
                        hintText: "العنوان",
                        useStyle2: false),
                    const VerticalSizedBox(height: 15),
                    Customtextfield(
                        controller: contentNotecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "من فضلك ادخل الملاحظة";
                          }
                          return null;
                        },
                        // onChanged: (p0) {
                        // onChanged(p0);
                        // },
                        hintText: "المحتوي",
                        useStyle2: false),
                  
                    const VerticalSizedBox(height: 15),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.circleAvatarBorderColor),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            addData();
                            titleNotecontroller!.clear();
                            contentNotecontroller!.clear();
                            // notecontroller!.clear();
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          "اضافة",
                          style: Textstyles.songsTopTitleStyle,
                        ))
                  ],
                ),
              ),
            ));
  }
}
