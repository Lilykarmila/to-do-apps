// import 'dart:async';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// import '../../../main.dart';
// import '../../features/notification/presentation/pages/notification.page.dart';
//
// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification!.title}');
//   print('Body: ${message.notification!.body}');
//   print('Payload: ${message.data}');
// }
//
// class NotificationServices {
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   //-- inital notification
//   Future<void> initNotification() async {
//     await _firebaseMessaging.requestPermission();
//     final fcMToken = await _firebaseMessaging.getToken();
//     print('Token: $fcMToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//
//     initPushNotification();
//   }
//
//   //-- for handle received messages
//   void handleMessage(RemoteMessage? message) {
//     if (message == null) return;
//     navigatorKey.currentState?.pushNamed(
//       NotificationPage.routeName,
//       arguments: message,
//     );
//     // Check if navigatorKey.currentState is not null before using it
//   }
//
//   // -- to initialize background settings
//   Future initPushNotification() async {
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       sound: true,
//       badge: true,
//     );
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//   }
// }
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:to_do_apps/main.dart';
import 'package:to_do_apps/src/features/notification/presentation/pages/notification.page.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification!.title}');
  print('Body: ${message.notification!.body}');
  print('Payload: ${message.data}');
}

class NotificationServices {
  final _firebaseMessaging = FirebaseMessaging.instance;
  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    navigatorKey.currentState?.pushNamed(
      NotificationPage.routeName,
      arguments: message,
    );
  }

  Future initPushNotification() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotification();
  }
}
