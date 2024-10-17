import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/textstyles/weights.dart';


class Textstyles {
  static  TextStyle hintTextStyle =  TextStyle(color: Colors.black,fontSize: 15.sp,);
  static  TextStyle darkTextStyle =  TextStyle(color: Colors.black,fontSize: 10.sp,);
  static  TextStyle hintTextStyle2 =  TextStyle(color: Colors.grey,fontSize: 15.sp);
  static TextStyle weddingNames = TextStyle(color: Colors.black,fontSize: 10.sp,fontWeight: FontWeights.bold);
  static TextStyle listViewTitles = TextStyle(fontWeight: FontWeights.thin,fontSize: 20.sp);
  static TextStyle heartViewTextStyle = TextStyle(fontSize: 10.sp);
  static TextStyle songsTopTitleStyle = TextStyle(color: Colors.white,fontSize: 15.sp);
  static TextStyle songNameStyle = TextStyle(color: const Color(0xffFB1E95),fontSize: 15.sp);
  static TextStyle nOfInvitedPeopleStyle =  TextStyle(color: Colors.white,fontSize: 20.sp);
  static TextStyle nameOfInvitedPeopleStyle =  TextStyle(fontSize: 13.sp,color: Colors.black,fontWeight: FontWeight.bold);
 static TextStyle advertisementStyle = TextStyle(fontWeight: FontWeights.extraBold,color: const Color(0xffD64276),fontSize:20.sp );
 static TextStyle blackStroke = TextStyle(
                  foreground: Paint()..style = PaintingStyle.stroke
                  .. strokeWidth = 1
                  .. color = Colors.black  ,
                  fontSize: 15.sp,fontWeight: FontWeights.thin);
}