import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class Customtextfield extends StatelessWidget {
  const Customtextfield({super.key, required this.hintText, required this.useStyle2});
  final String hintText;
  final bool useStyle2;

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
                    decoration: InputDecoration(
                      hintStyle: useStyle2? Textstyles.hintTextStyle2:Textstyles.hintTextStyle,
                      filled: true,
                      fillColor: AppColors.textfieldFillColor,
                      hintText: hintText,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.textfieldBorderColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.textfieldBorderColor),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.textfieldBorderColor),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.textfieldBorderColor),
                      ),
                    ),
                  );
  }
}