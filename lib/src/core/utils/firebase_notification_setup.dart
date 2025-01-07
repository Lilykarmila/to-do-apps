// lib/src/core/utils/firebase_notification_setup.dart

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:to_do_apps/src/core/utils/notification_services.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> backgroundHandler(RemoteMessage message) async {
  print('Message : ${message.data}');
}

Future<void> firebaseNotificationSetup() async {
  await Firebase.initializeApp();
  //-- firebase messaging
  await NotificationServices().initNotification();

  // -- listen to bg notification
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  // -- on background notification tapped
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     navigatorKey.currentState!.pushNamed(
  //       NotificationPage.routeName,
  //       arguments: message,
  //     );
  //   }
  // });

  // -- handle foreground notification
  // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   String payloadData = jsonEncode(message.data);
  //   print('Got a message in foreground');
  // final notification = message.notification;
  // if (notification != null) {
  //   NotificationServices.showSimpleNotification(
  //     title: notification.title!,
  //     body: notification.body!,
  //     payload: payloadData,
  //   );
  // }
  // });
}
