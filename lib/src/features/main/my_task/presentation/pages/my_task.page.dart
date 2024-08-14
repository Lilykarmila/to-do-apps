import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/core/utils/pop_up_menu_utils.dart';

import '../../../../dasshboard/presentation/pages/dashboard_page.dart';
import '../widgets/header_container.widget.dart';
import '../widgets/list_task.widget.dart';

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({super.key});
  static const routeName = '/my-task';

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContainer(
              leftIcon: Iconsax.category,
              onLeftIconPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashboardPage()),
                );
              },
              rightIcon: Iconsax.more,
              onRightIconPressed: (context) => PopupMenuUtils().showPopupMenu(context),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Today',
                    style: GoogleFonts.poppins(
                      color: AppColorTheme.primary500,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTaskWidget(
                    taskTitle: 'ketemu dosen',
                    taskDate: '12 juli',
                    tag: 'kerja',
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
