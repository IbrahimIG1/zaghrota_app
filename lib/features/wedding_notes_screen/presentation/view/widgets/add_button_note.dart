import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_datefield.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';

class AddNoteDataDialogue extends StatelessWidget {
  const AddNoteDataDialogue({
    super.key,
    required this.formKey,
    required this.onChanged,
    required this.addData, this.titleNotecontroller, this.contentNotecontroller, this.dateNotecontroller,
  });

  final GlobalKey<FormState> formKey;
  final void Function(String) onChanged;
  final TextEditingController? titleNotecontroller;
  final TextEditingController? contentNotecontroller;
  final TextEditingController? dateNotecontroller;
  
  
  final Function addData;
  
  
  
  @override
  Widget build(context) {
    return FloatingActionButton(
      mini: true,
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
    DateTime? entrydate ;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Center(
                  child: Text(
                "بيانات الملاحظة",
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
                            return "من فضلك أدخل عنوان الملاحظة";
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
                    StatefulBuilder(
            builder: (context,set) {
              return CustomDatefield(
                // datecont: dateNotecontroller,
                validator: (p0) {
                  if (entrydate == null) {
                    return "من فضلك أدخل التاريخ ";
                  }
                  return null;
                },
                useStyle2: false,
                onTap: () async {
                  
                  entrydate = await showDatePicker(
                    
                    context: context,
                    initialDate: DateTime.now().add(const Duration(days: 1)),
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime(2090),
                  );
                  
                  entrydate ??= DateTime.now();
                  
                  dateNotecontroller!.text = entrydate.toString();

                  // setState(() {});
                  set(() {
                    
                  },);
                  print(entrydate!.year);
                },
                hintText: entrydate == null
                    ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                    : '${entrydate!.day}/${entrydate!.month}/${entrydate!.year}',
              );
            }
          ),
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
                            dateNotecontroller!.clear();
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
