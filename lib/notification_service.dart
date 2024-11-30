
// import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  //----- this static function for solving error
  static void onrecive(NotificationResponse details){} 
 static Future<void> init()async{
  InitializationSettings settings = const InitializationSettings(
    android: AndroidInitializationSettings("@mipmap/ic_launcher"),
    iOS: DarwinInitializationSettings()
  );
   await flutterLocalNotificationsPlugin.initialize(
    settings,
   onDidReceiveBackgroundNotificationResponse: onrecive,
   onDidReceiveNotificationResponse: onrecive
   );
 }

 static Future<void> sendSimpleNotification()async{
  //- khalid is title of notification 
  // conteeent is the content of title 
flutterLocalNotificationsPlugin.show(0, "Khalid", "conteeeent",const NotificationDetails(
android: AndroidNotificationDetails("0", "Android",priority: Priority.max,importance: Importance.max),
iOS: DarwinNotificationDetails()
) );
 }

 static Future<void> repeatedNotification()async{
  //- khalid is title of notification 
  // conteeent is the content of title 
flutterLocalNotificationsPlugin.periodicallyShow(1, "khalid", "conteent", 
RepeatInterval.hourly
, const NotificationDetails(
android: AndroidNotificationDetails("0", "Android",priority: Priority.max,importance: Importance.max),
iOS: DarwinNotificationDetails()
) );
 }

 static Future<void> schduledNotification({required int id,required String title,required DateTime date,String? body})async{
    tz.initializeTimeZones();
  
    
    await flutterLocalNotificationsPlugin.zonedSchedule(id, title, body,
     tz.TZDateTime(tz.getLocation("Africa/Cairo"), date.year, date.month,date.day, date.hour, date.minute+5),
      const NotificationDetails(
        android: AndroidNotificationDetails("1", "chan"),
        iOS: DarwinNotificationDetails()
      ), 
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
    

 }

 static Future<void> cancelNotification({required int index})async{
  await flutterLocalNotificationsPlugin.cancel(index);
 }
}