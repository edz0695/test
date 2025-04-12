// import 'dart:math';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationServices {
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   void initLocalNotifications(BuildContext context, RemoteMessage message) async{
//     var androidInitializationSettings = const AndroidInitializationSettings('@mipmap-mdpi/ic_launcher');
//
//     var initializationSetting = InitializationSettings(
//         android: androidInitializationSettings
//     );
//     await _flutterLocalNotificationsPlugin.initialize(
//         initializationSetting,
//       onDidReceiveNotificationResponse: (payload){
//
//       }
//     );
//   }
//
//   Future<void> showNotification(RemoteMessage message)async{
//
//     // AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//     //     Random.secure().nextInt(100000).toString(), 'sambhavapps notifications');
//
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       message.notification!.android!.channelId.toString(),
//       message.notification!.android!.channelId.toString() ,
//       importance: Importance.max  ,
//       showBadge: true ,
//     );
//
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString() ,
//       channelDescription: 'your channel description',
//       importance: Importance.high,
//       priority: Priority.high ,
//       ticker: 'ticker' ,
//       //  icon: largeIconPath
//     );
//
//     NotificationDetails notificationDetails = NotificationDetails(
//         android: androidNotificationDetails
//     );
//
//
//     Future.delayed(Duration.zero , (){
//       _flutterLocalNotificationsPlugin.show(
//           0,
//           message.notification!.title.toString(),
//           message.notification!.body.toString(),
//           notificationDetails);
//     });
//
//   }
//
//   void requestNotificatPermission() async{
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: true,
//       criticalAlert: true,
//       provisional: true,
//       sound: true
//     );
//
//     if(settings.authorizationStatus == AuthorizationStatus.authorized){
//       print('permission granted for notification');
//     }
//     else{
//       print('permission denied for notification');
//     }
//   }
//   Future<String> getDeviceToken() async{
//     String? token = await messaging.getToken();
//     return token!;
//   }
//   void firebaseInit(){
//     FirebaseMessaging.onMessage.listen((message) {
//       print(message.notification!.title.toString());
//       print(message.notification!.body.toString());
//       showNotification(message);
//     });
//   }
//
// }