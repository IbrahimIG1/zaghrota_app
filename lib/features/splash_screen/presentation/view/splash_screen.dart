
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/shared_prefrence_helper/shared_prefrences_helper.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
bool move=false;
void navigation(context)async{
  Future.delayed(const Duration(seconds: 5,),() {
    ControlNavigation.navigationToController(pageName:SharedPrefrenceHelper.sharedPreferences!.getString("hash") == null
                ? ScreenNames.loginScreen
                : ScreenNames.homeScreen, 
                 context: context);
  },);
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      setState(() {
        move = true; // Start the animation.
      });
    });
    navigation(context);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedAlign(alignment:move?AlignmentDirectional.bottomEnd: AlignmentDirectional.bottomStart , duration:const  Duration(milliseconds: 4500),
          child: SizedBox(
            height: 100.h,
            width: 100.w,
            child: Image.asset("assets/images/login_images/couple5.png",fit: BoxFit.fill,)),
          ),
          Text("ليلة العمر",style: Textstyles.stroke.copyWith(fontSize: 30.sp),),
          LoadingAnimationWidget.twistingDots(leftDotColor: AppColors.circleAvatarBorderColor, rightDotColor: Colors.black, size:25.sp)
        ],
      ),
    ));
  }
}