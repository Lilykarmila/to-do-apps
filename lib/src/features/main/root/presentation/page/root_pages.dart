import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/features/main/calendar/presentation/pages/calendar_page.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/pages/my_task.page.dart';

class RootPage extends StatefulWidget {
  static const routeName = '/';

  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
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
          onPressed: () {},
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          // useLegacyColorScheme: true,
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
