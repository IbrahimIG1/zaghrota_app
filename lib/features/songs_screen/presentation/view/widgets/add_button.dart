import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';

class AddSongDataDialogue extends StatelessWidget {
  const AddSongDataDialogue({
    super.key,
    required this.formKey,
    required this.onChanged,
    required this.addData, this.singerNamecontroller, this.songNamecontroller, this.notecontroller, this.orderSongnumbercontroller,
  });

  final GlobalKey<FormState> formKey;
  final void Function(String) onChanged;
  final TextEditingController? singerNamecontroller;
  final TextEditingController? songNamecontroller;
  final TextEditingController? notecontroller;
  final TextEditingController? orderSongnumbercontroller;
  final Function addData;
  @override
  Widget build(context) {
    return FloatingActionButton(
        backgroundColor: AppColors.circleAvatarBorderColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Center(
                        child: Text(
                      "بيانات المعزوم",
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
                              controller: songNamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "من فضلك ادخل الأغنية";
                                }
                                return null;
                              },
                              // onChanged: (p0) {
                              // onChanged(p0);
                              // },
                              hintText: "اسم الأغنية",
                              useStyle2: false),
                          const VerticalSizedBox(height: 15),
                          Customtextfield(
                              controller: singerNamecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "من فضلك ادخل المغني";
                                }
                                return null;
                              },
                              // onChanged: (p0) {
                              // onChanged(p0);
                              // },
                              hintText: "اسم المغني",
                              useStyle2: false),
                          const VerticalSizedBox(height: 15),
                          Customtextfield(
                              controller: notecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "من فضلك ادخل نوع الأغنية";
                                }
                                return null;
                              },
                              // onChanged: (p0) {
                              // onChanged(p0);
                              // },
                              hintText: "ادخل نوع الأغنية( سلو- مهرجان)",
                              useStyle2: false),
                        
                          const VerticalSizedBox(height: 15),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.circleAvatarBorderColor),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  addData();
                                  songNamecontroller!.clear();
                                  singerNamecontroller!.clear();
                                  notecontroller!.clear();
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
        },
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: Colors.white,
        ));
  }
}
