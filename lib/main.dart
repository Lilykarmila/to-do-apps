import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:to_do_apps/src/config/routes/routes.dart';
import 'package:to_do_apps/src/core/utils/notification_services.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:to_do_apps/src/features/notification/presentation/pages/notification.page.dart';
import 'package:to_do_apps/src/features/splash_screen/presentation/pages/splash_page.dart';

import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) return;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    //-- firebase messaging
    await PushNotification().initNotification();

    //-- local notification
    await PushNotification().initLocalNotification();

    //-- listen to bg notification
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundMessage);

    //-- on background notification tapped
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.notification != null) {
        navigatorKey.currentState!.pushNamed(
          NotificationPage.routeName,
          arguments: message,
        );
      }
    });
    //-- handle foreground notification
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String payloadData = jsonEncode(message.data);
      print('Got a message in foreground');
      final notification = message.notification;
      if (notification != null) {
        PushNotification.showSimpleNotification(
          title: notification.title!,
          body: notification.body!,
          payload: payloadData,
        );
      }
    });
  } catch (e) {
    print('Error Initializing Firebase: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      initialRoute: SplashPage.routeName,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
