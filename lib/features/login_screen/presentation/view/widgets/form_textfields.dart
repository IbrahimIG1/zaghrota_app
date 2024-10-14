import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_Text_Field.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_datefield.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/sign_in_button.dart';

class FormTextfields extends StatefulWidget {
  const FormTextfields({super.key, required this.useStyle2});
  final bool useStyle2;

  @override
  State<FormTextfields> createState() => _FormTextfieldsState();
}
DateTime? entrydate;

class _FormTextfieldsState extends State<FormTextfields> {
  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
         Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 12.r),
                    child:  Customtextfield(useStyle2: widget.useStyle2,hintText: "اسم العريس",),
                  ),
                  const VerticalSizedBox(height: 30),
                   Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 12.r),
                    child: Customtextfield(useStyle2: widget.useStyle2,hintText: "اسم العروسة"),
                  ),
                  const VerticalSizedBox(height: 30),

                   Padding(
                    padding:   EdgeInsets.symmetric(horizontal: 12.r),
                    child: CustomDatefield(
                      useStyle2: widget.useStyle2,
                    onTap: () async {
        entrydate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2090),
                      );
                      entrydate ??= DateTime.now();
                      setState(() {});
      },
      hintText: entrydate == null
                        ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                        : '${entrydate!.day}/${entrydate!.month}/${entrydate!.year}',
                    )
                  ),
                  const VerticalSizedBox(height: 30),
                  SignInButton(arguments: entrydate==null?DateTime.now() as Object :entrydate as Object,)
      ],
    ));
  }
}