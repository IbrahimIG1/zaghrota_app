import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_Text_Field.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_datefield.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/sign_in_button.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view_model/cubit/farah_data_cubit.dart';

class FormTextfields extends StatefulWidget {
  const FormTextfields({super.key, required this.useStyle2});
  final bool useStyle2;

  @override
  State<FormTextfields> createState() => _FormTextfieldsState();
}

DateTime? entrydate;
final GlobalKey<FormState> keey = GlobalKey<FormState>();
TextEditingController aressName = TextEditingController();
TextEditingController arosaName = TextEditingController();
String? aresName;
String? arosName;

class _FormTextfieldsState extends State<FormTextfields> {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: keey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Customtextfield(
                onChanged: (p0) {
                  aresName = p0;
                },
                controller: aressName,
                validator: (p0) {
                  if (p0!.isEmpty || p0 == "") {
                    return "من فضلك أدخل اسم العريس";
                  }
                  return null;
                },
                useStyle2: widget.useStyle2,
                hintText: "اسم العريس",
              ),
            ),
            const VerticalSizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Customtextfield(
                  onChanged: (p0) {
                    arosName = p0;
                  },
                  controller: arosaName,
                  validator: (p0) {
                    if (p0!.isEmpty || p0 == "") {
                      return "من فضلك أدخل اسم العروسة";
                    }
                    return null;
                  },
                  useStyle2: widget.useStyle2,
                  hintText: "اسم العروسة"),
            ),
            const VerticalSizedBox(height: 30),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.r),
                child: CustomDatefield(
                  validator: (p0) {
                    if (entrydate == null) {
                      return "من فضلك أدخل تاريخ الزواج";
                    }
                    return null;
                  },
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
                )),
            const VerticalSizedBox(height: 30),
            BlocListener<FarahDataCubit, FarahDataState>(
              listener: (context, state) {
                if (state is FarahDataSuccess) {
                  print("msm333333333333333333333");
                }
                else{
                  print(state.toString());
                }
                
                             },
              child: SignInButton(
                onPressed: () async {
                  if (keey.currentState!.validate()) {
                    BlocProvider.of<FarahDataCubit>(context).addData(
                      context,
                      FarahModel(aresName: aresName!, arosaName: arosName!, farahTime: entrydate!));
                                           

                    // final prefs = await SharedPreferences.getInstance();
                    // await prefs.setString("aresName", aresName!);
                    // await prefs.setString("arosaName", arosName!);
                    // await prefs.setString(
                    //     "date",
                    //     entrydate == null
                    //         ? DateTime.now().toIso8601String()
                    //         : entrydate!.toIso8601String());
                    // ControlNavigation.navigationToController(
                    //     pageName: ScreenNames.homeScreen,
                    //     context: context,
                    //     arguments: entrydate == null
                    //         ? [
                    //             prefs.getString("aresName"),
                    //             prefs.getString("arosaName"),
                    //             DateTime.now()
                    //           ]
                    //         : [
                    //             prefs.getString("aresName"),
                    //             prefs.getString("arosaName"),
                    //             DateTime.parse(prefs.getString("date")!)
                    //           ]);
                  }
                },
              ),
            )
          ],
        ));
  }
}
