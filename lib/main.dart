import 'package:flutter/material.dart';
import 'package:to_do_apps/src/features/main/dasshboard/presentation/pages/dashboard_page.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/pages/my_task.page.dart';

void main() {
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
      home: MyTaskPage(),
    );
  }
}
