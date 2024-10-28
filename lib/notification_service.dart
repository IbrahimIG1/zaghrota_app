
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

 static Future<void> cancelNotification({required int index})async{
  await flutterLocalNotificationsPlugin.cancel(index);
 }
}