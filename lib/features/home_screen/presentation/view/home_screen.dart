import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/heart_drawer.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/widgets/homechoices_listview.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view_model/cubit/home_screen_cubit.dart';
import 'package:zaghrota_app/features/login_screen/data/farah_model.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_datefield.dart';
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
            // const CustomLoginAppbar(),
            BlocConsumer<HomeScreenCubit, HomeScreenState>(
              listener: (context, state) {
                
              },
              builder: (context, state) {
                
                if(state is HomeScreenSuccess){
                  var cubit = HomeScreenCubit.get(context);
                 return Container(
                  decoration: BoxDecoration(
                    color: AppColors.heartColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r)
                    )
                  ),
                  // height: 0.25.sh,
                  width: 1.sw,
                   child: Column(
                     children: [
                      GestureDetector(
                        onTap:() {
                          showUpdateWeddingDialog(context, aresName, arosName, entrydate, cubit);
                        } ,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6,top: 5,left: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                              child: Icon(Icons.edit,size: 20.sp,color: AppColors.scaffoldColor,),
                              ),
                                   GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse("https://leilatelomr.aiotgroups.com/privacy-policy"));
                    },
                    child: Text("Privacy Policies Terms",style: Textstyles.blackStroke.copyWith(fontSize: 10.sp,decoration: TextDecoration.underline),))
                            ],
                          ),
                        ),
                      ),
                      //  IconButton(onPressed: () {
                         
                      //  }, icon: Icon(Icons.edit_outlined)),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                          SizedBox(
                    height: 80.h,
                    width: 60.w,
                    child: Image.asset("assets/images/login_images/couple5.png",fit: BoxFit.fill,),),
                           HeartDrawer(
                            onTap: () {
                              showUpdateWeddingDialog(context, aresName, arosName, entrydate, cubit);
                                         
                            },
                            data: state.data,),

                            SizedBox(
                    height: 70.h,
                    width: 60.w,
                    child: Image.asset("assets/images/login_images/couple4.png",fit: BoxFit.fill,)),
                         ],
                       ),
                     ],
                   ),
                 );
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
      child: SingleChildScrollView(
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
                      ),
    );
  }
}
