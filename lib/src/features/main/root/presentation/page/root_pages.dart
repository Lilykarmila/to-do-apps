import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/features/main/calendar/presentation/pages/calendar_page.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/pages/my_task.page.dart';
import 'package:timezone/timezone.dart' as tz;

class RootPage extends StatefulWidget {
  static const routeName = '/';

  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  DateTime? _selectedDate;
  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  Future<void> _scheduleNotification(DateTime scheduledTime) async {
    var androidDetails = AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.high,
      priority: Priority.high,
    );

    var generalNotificationDetails = NotificationDetails(
      android: androidDetails,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Pengingat Acara',
      'Waktunya untuk acara Anda!',
      tz.TZDateTime.from(scheduledTime, tz.local),
      generalNotificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void _addNewEvent() async {
    DateTime now = DateTime.now();
    DateTime scheduledTime = now.add(Duration(seconds: 10)); // Jadwalkan notifikasi dalam 10 detik

    // Panggil fungsi untuk menjadwalkan notifikasi
    await _scheduleNotification(scheduledTime);

    // Tampilkan pesan konfirmasi
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Acara baru ditambahkan dan notifikasi dijadwalkan!'),
    ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "What would you like to do?",
                    border: InputBorder.none,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Iconsax.calendar),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Iconsax.warning_2),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Iconsax.tag),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Iconsax.send1),
                      onPressed: () => _addNewEvent,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyTaskPage(),
    const MyCalendarPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_currentIndex],
        floatingActionButton: FloatingActionButton(
          // elevation: 1,
          onPressed: () => _showModalBottomSheet(context),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          useLegacyColorScheme: true,
          currentIndex: _currentIndex,
          selectedItemColor: AppColorTheme.primary400,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.task),
              label: 'My Task',
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.calendar),
              label: 'Appointment',
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
