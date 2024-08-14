import 'package:flutter/material.dart';

class MyCalendarPage extends StatelessWidget {
  static const routeName = '/calendar';
  const MyCalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('CALENDAR'),
      ),
    );
  }
}
