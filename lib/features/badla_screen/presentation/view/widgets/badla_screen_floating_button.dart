import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';

class BadlaScreenFloatingButton extends StatelessWidget {
  const BadlaScreenFloatingButton({
    super.key,
    required this.formKey,
    this.namecontroller,
    required this.addData,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController? namecontroller;
  final void Function() addData;
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
                              controller: namecontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "من فضلك ادخل اسم القطعة";
                                }
                                return null;
                              },
                              // onChanged: (p0) {
                              // onChanged(p0);
                              // },
                              hintText: "اسم القطعة",
                              useStyle2: false),
                          const VerticalSizedBox(height: 15),
                         
                          const VerticalSizedBox(height: 15),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.circleAvatarBorderColor),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  addData();
                                  namecontroller!.clear();
                                  
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
