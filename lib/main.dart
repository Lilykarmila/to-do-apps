import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do_apps/src/config/routes/routes.dart';
import 'package:to_do_apps/src/core/utils/firebase_notification_setup.dart';
import 'package:to_do_apps/src/core/utils/notification_services.dart';
import 'package:to_do_apps/src/features/splash_screen/presentation/pages/splash_page.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NotificationServices().initNotification();

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
