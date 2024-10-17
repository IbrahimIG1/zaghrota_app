import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/heart_drawer.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/homechoices_listview.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view_model/cubit/home_screen_cubit.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_datefield.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     DateTime? entrydate;
String? aresName;
String? arosName;
    return  SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            const CustomLoginAppbar(),
            BlocConsumer<HomeScreenCubit, HomeScreenState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                print(state.toString());
                if(state is HomeScreenSuccess){
                  var cubit = HomeScreenCubit.get(context);
                 return HeartDrawer(
                  onTap: () {
                    showUpdateWeddingDialog(context, aresName, arosName, entrydate, cubit);
              
                  },
                  data: state.data,);
                }
                else{
                  return const CircularProgressIndicator(color: AppColors.circleAvatarBorderColor,);
                }
                
              },
            ),
            const HomechoicesListview()
          ],
        ),
      ),
    ));
  }

  void showUpdateWeddingDialog(BuildContext context, String? aresName, String? arosName, DateTime? entrydate, HomeScreenCubit cubit) {
    showDialog(
                    context: context,
                    builder: (context)=> AlertDialog(
    backgroundColor: AppColors.scaffoldColor,
    title: Center(
      child: Text(
        "تعديل بيانات الشخصية",
        style: Textstyles.nameOfInvitedPeopleStyle,
      ),
    ),
    content: Form(
      key: keeey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Customtextfield(
            onChanged: (p0) {
              aresName = p0;
            },
            // controller: aressName,
            validator: (p0) {
              if (p0!.isEmpty || p0 == "") {
                return "من فضلك أدخل اسم العريس";
              }
              return null;
            },
            useStyle2: false, hintText: "اسم العريس ",
          ),
          const VerticalSizedBox(height: 10),
          Customtextfield(
              onChanged: (p0) {
                arosName = p0;
              },
              // controller:arosaName ,
              validator: (p0) {
                if (p0!.isEmpty || p0 == "") {
                  return "من فضلك أدخل اسم العروسة";
                }
                return null;
              },
              useStyle2: false,
              hintText: "اسم العروسة"),
          const VerticalSizedBox(height: 10),
          StatefulBuilder(
            builder: (context,set) {
              return CustomDatefield(
                validator: (p0) {
                  if (entrydate == null) {
                    return "من فضلك أدخل تاريخ الزواج";
                  }
                  return null;
                },
                useStyle2: false,
                onTap: () async {
                  entrydate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2090),
                  );
                  entrydate ??= DateTime.now();
                  // setState(() {});
                  set(() {
                    
                  },);
                },
                hintText: entrydate == null
                    ? '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'
                    : '${entrydate!.day}/${entrydate!.month}/${entrydate!.year}',
              );
            }
          ),
          const VerticalSizedBox(height: 10),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.scaffoldColor),
              onPressed: () async {
                if (keeey.currentState!.validate()) {
                  cubit.updateFarahItem(
                    model: FarahModel(aresName: aresName!, arosaName: arosName!, farahTime: entrydate!));
                  Navigator.pop(context);
                }
              },
              child: Text(
                "تعديل",
                style: TextStyle(
                    color: Colors.green, fontSize: 11.sp),
              ))
        ],
      ),
    ),
                      ),
    );
  }
}
