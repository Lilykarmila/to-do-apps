import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';

import '../../../../core/utils/local_notification.dart';

class NotificationPage extends StatelessWidget {
  static const routeName = '/notification';
  NotificationPage({
    super.key,
  });
  final NotificationService _notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          'Notification',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColorTheme.primary400,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _notificationService.showNotification(
              'Hello',
              'This is a local notification!',
            );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotificationPage()),
            );
          },
          child: Text('Show Notification'),
        ),
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(10),
    //   child: Container(
    //     height: 80,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       border: Border.all(color: AppColorTheme.primary300),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text('NOTIFIKASI BABI'),
    //       ],
    //     ),
    //   ),
    // ),
    // );
  }
}
