

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceHelper {

  static SharedPreferences? sharedPreferences;

  static Future<void> initSharedpref()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

 
}