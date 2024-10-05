import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/form_textfields.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/image_view.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/sign_in_button.dart';

class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration:const  BoxDecoration(
            gradient : AppColors.logInGradient
          ),
          child: SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomLoginAppbar(),
                  verticalSizedBox(60),
                  const ImageView(),
                  verticalSizedBox(60),
                 const FormTextfields(useStyle2: true,),
                  
                ],
              ),
            ),
          ),
        ),
        
        ),
    );
  }
}