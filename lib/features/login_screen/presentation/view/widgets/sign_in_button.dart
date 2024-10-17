import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, this.onPressed, this.title,});
final void Function()? onPressed;
final String? title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(color: AppColors.buttonBorder)
                      )
                    ),
                    onPressed: onPressed,
                   child:  Text(title??"دخول",style: Textstyles.hintTextStyle,));
  }
}