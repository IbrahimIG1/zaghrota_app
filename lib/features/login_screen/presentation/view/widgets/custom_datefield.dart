import 'package:flutter/material.dart';
import 'package:zaghrota_app/core/colors/colors.dart';
import 'package:zaghrota_app/core/textstyles/textstyles.dart';

class CustomDatefield extends StatefulWidget {
  const CustomDatefield({super.key, required this.useStyle2, this.onTap, required this.hintText, this.validator, this.datecont,});
 final bool useStyle2;
 final void Function()? onTap;
 final String? Function(String?)? validator;
 final String hintText;
 final TextEditingController? datecont;
 

  @override
  State<CustomDatefield> createState() => _CustomDatefieldState();
}
class _CustomDatefieldState extends State<CustomDatefield> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
          controller: widget.datecont,
          validator: widget.validator,
          onTap: widget.onTap,
                        readOnly: true,
                        decoration: InputDecoration(
                          hintStyle: widget.useStyle2? Textstyles.hintTextStyle2:Textstyles.hintTextStyle,
                          filled: true,
                          fillColor: AppColors.textfieldFillColor,
                          hintText: widget.hintText,
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
                      ),
      ],
    );
  }
}