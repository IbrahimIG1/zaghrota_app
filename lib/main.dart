import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zaghrota_app/core/app_Themes/app_theme.dart';
import 'package:zaghrota_app/core/navigation/screen_names.dart';
import 'package:zaghrota_app/features/home_screen/presentation/view/home_screen.dart';
import 'package:zaghrota_app/features/login_screen/presentation/view/login_screen.dart';
import 'package:zaghrota_app/features/wedding_items_screen/presentation/view/wedding_items_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const  Size(360,800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          ScreenNames.loginScreen: (context)=> const LoginScreen(),
          ScreenNames.homeScreen: (context)=> const HomeScreen(),
          ScreenNames.weddingItemsScreen:(context)=> const WeddingItemsScreen()
        },
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        initialRoute: ScreenNames.loginScreen,
      ),
    );
  }
}
