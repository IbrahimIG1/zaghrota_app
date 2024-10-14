import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/navigation/control_navigation.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.arguments, required this.keey});
   final Object arguments;
   final GlobalKey<FormState> keey;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: AppColors.buttonBorder)
                      )
                    ),
                    onPressed: () {
                  if(keey.currentState!.validate()){
                  ControlNavigation().navigationToController(pageName: ScreenNames.homeScreen,context:context,arguments:  arguments);
                  }
                    },
                   child:  Text("دخول",style: Textstyles.hintTextStyle,));
  }
}