import 'package:flutter/material.dart';

class AppColors {
  static const Gradient appBarLinearColor = LinearGradient(colors: [Color(0xFFD34B94),Color(0xffD83E67),Color(0xFFDC303B)],
  begin: Alignment.centerLeft,end: Alignment.centerRight,);

  static const Gradient logInGradient = LinearGradient(colors: [Color(0xffFAC8F2),Color(0xffBF46AB),Color(0xffF5C1ED)],
            begin: Alignment.topLeft,end: Alignment.bottomRight);
  
  static const Color textfieldFillColor = Colors.white;
  static const Color textfieldBorderColor = Colors.black;

  static const Color buttonBorder = Color(0xffAA39C6);
  static const Color scaffoldColor = Colors.white;
  static const Color heartColor = Color(0xffE766AC);
  static const Color circleAvatarBorderColor = Color(0xffD83E67);
  static const Color containerBackground = Color(0xffD83E67);
  static const Color containerBorderColor = Color.fromARGB(255, 247, 242, 242);
  static const Color containerBackground2 = Color(0xffFB1E95);
  static const List<BoxShadow> containerShadowColor = [BoxShadow(color: Colors.grey,blurRadius: 10)];
  


}