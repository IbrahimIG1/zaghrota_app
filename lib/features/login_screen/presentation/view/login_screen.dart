import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';
import 'package:zaghrota_app/core/usable/sizedbox.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/custom_login_appbar.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/form_textfields.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/widgets/image_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
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
          child:SingleChildScrollView(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomLoginAppbar(),
                  VerticalSizedBox(height: 60),
                  ImageView(),
                  VerticalSizedBox(height: 60),
                 FormTextfields(
                  useStyle2: false,),
                  GestureDetector(
                    onTap: () {
                      
                      launchUrl(Uri.parse("https://leilatelomr.aiotgroups.com/privacy-policy"));
                    },
                    child: Text("Privacy Policies Terms",style: Textstyles.blackStroke.copyWith(decoration: TextDecoration.underline),))
                  
                ],
              ),
            ),
          ),
        ),
        
        ),
    );
    
  }
}