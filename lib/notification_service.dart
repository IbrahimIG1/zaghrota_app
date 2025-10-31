
// // import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// class NotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   //----- this static function for solving error
//   static void onrecive(NotificationResponse details){} 
//  static Future<void> init()async{
//   InitializationSettings settings = const InitializationSettings(
//     android: AndroidInitializationSettings("@mipmap/launcher_icon"),
//     iOS: DarwinInitializationSettings()
//   );
//    await flutterLocalNotificationsPlugin.initialize(
//     settings,
//    onDidReceiveBackgroundNotificationResponse: onrecive,
//    onDidReceiveNotificationResponse: onrecive
//    );
//  }

//  static Future<void> sendSimpleNotification()async{
//   //- khalid is title of notification 
//   // conteeent is the content of title 
// flutterLocalNotificationsPlugin.show(0, "Khalid", "conteeeent",const NotificationDetails(
// android: AndroidNotificationDetails("0", "Android",priority: Priority.max,importance: Importance.max),
// iOS: DarwinNotificationDetails()
// ) );
//  }

//  static Future<void> repeatedNotification()async{
//   //- khalid is title of notification 
//   // conteeent is the content of title 
// flutterLocalNotificationsPlugin.periodicallyShow(
//   androidScheduleMode: AndroidScheduleMode.exact,
//   1, "khalid", "conteent", 
// RepeatInterval.hourly
// , const NotificationDetails(
// android: AndroidNotificationDetails("0", "Android",priority: Priority.max,importance: Importance.max),
// iOS: DarwinNotificationDetails()
// ) );
//  }

//  static Future<void> schduledNotification({required int id,required String title,required DateTime date,String? body})async{
//     tz.initializeTimeZones();
  
    
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       androidScheduleMode: AndroidScheduleMode.exact,
//       id, title, body,
//      tz.TZDateTime(tz.getLocation("Africa/Cairo"), date.year, date.month,date.day, date.hour, date.minute+5),
//       const NotificationDetails(
//         android: AndroidNotificationDetails("1", "chan"),
//         iOS: DarwinNotificationDetails()
//       ), 
      
//       );
    

//  }

//  static Future<void> cancelNotification({required int index})async{
//   await flutterLocalNotificationsPlugin.cancel(index);
//  }

//  static Future<void> sendNotificationAfterOneMinute() async {
//     tz.initializeTimeZones();

//     // Get current time in Cairo timezone
//     tz.TZDateTime now = tz.TZDateTime.now(tz.getLocation('Africa/Cairo'));

//     // Add 1 minute to the current time
//     tz.TZDateTime scheduledTime = now.add(Duration(seconds: 10));

//     // Schedule the notification after 1 minute
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0, // Notification ID
//       'مرحبا بك!', // Title
//       'يسعدنا انضمامك, قم بترتيب كل ما تريد معنا..', // Content/Body
//       scheduledTime, // Scheduled time (1 minute later)
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           '1', // Channel ID
//           'Notifications', // Channel Name
//           importance: Importance.max,
//           priority: Priority.max,
//         ),
//         iOS: DarwinNotificationDetails(),
//       ),
      
//       androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//     );
//   }
// }