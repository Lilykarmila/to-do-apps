import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do_apps/src/config/theme/color.theme.dart';
import 'package:to_do_apps/src/core/utils/auth_service.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:to_do_apps/src/features/notification/presentation/pages/notification.page.dart';

class PopupMenuUtils {
  void showPopupMenu(BuildContext context) {
    bool showLabel = true;
    bool showCompleted = true;
    showMenu(
      context: context,
      color: Colors.white,
      popUpAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 300),
      ),
      position: const RelativeRect.fromLTRB(100, 100, 0, 0),
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide.none,
      ),
      items: [
        PopupMenuItem<int>(
          value: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                NotificationPage.routeName,
              );
            },
            child: const Row(
              children: [
                Icon(CupertinoIcons.bell, color: AppColorTheme.primary400),
                SizedBox(width: 8),
                Expanded(child: Text('Notification')),
              ],
            ),
          ),
        ),
        PopupMenuItem<int>(
          padding: const EdgeInsets.only(right: 0, left: 10),
          value: 0,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                children: [
                  const Icon(Iconsax.tag, color: AppColorTheme.primary400),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Show Label')),
                  Checkbox(
                    shape: const CircleBorder(),
                    activeColor: AppColorTheme.primary400,
                    value: showLabel,
                    onChanged: (bool? value) {
                      setState(() {
                        showLabel = value!;
                      });
                      // To close the menu when checkbox is clicked
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        PopupMenuItem<int>(
          padding: const EdgeInsets.only(right: 0, left: 10),
          value: 0,
          child: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                children: [
                  const Icon(Iconsax.tick_circle, color: AppColorTheme.primary400),
                  const SizedBox(width: 8),
                  const Expanded(child: Text('Show Completed')),
                  Checkbox(
                    shape: const CircleBorder(),
                    activeColor: AppColorTheme.primary400,
                    value: showCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        showCompleted = value!;
                      });
                      // To close the menu when checkbox is clicked
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              _showSortMenu(context);
            },
            child: const Row(
              children: [
                Icon(Iconsax.arrow_swap, color: AppColorTheme.primary400),
                SizedBox(width: 8),
                Expanded(child: Text('Sort')),
              ],
            ),
          ),
        ),
        PopupMenuItem<int>(
          value: 2,
          child: InkWell(
            onTap: () async {
              await AuthService.logout().then((value) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Berhasil Logout")));
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.routeName,
                  (Route<dynamic> route) => false,
                );
              });
            },
            child: const Row(
              children: [
                Icon(Iconsax.logout, color: Colors.red),
                SizedBox(width: 8),
                Expanded(
                    child: Text(
                  'Log Out',
                  style: TextStyle(color: Colors.red),
                )),
              ],
            ),
          ),
        ),
      ],
    ).then((value) {
      // Handle the selected menu item
      switch (value) {
        case 0:
          // Handle Show Label
          break;
        case 1:
          // Handle Show Completed
          break;
        case 2:
          // Handle Sort
          break;
      }
    });
  }

  static void _showSortMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 0),
          contentPadding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Spacer(),
              Text('Sort by',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  )),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    minTileHeight: -1,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Iconsax.calendar, color: AppColorTheme.primary400),
                    title: const Text('Due Date'),
                    trailing: Radio(
                      value: 1,
                      groupValue: 0, // replace with a state variable
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    minTileHeight: -1,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Iconsax.warning_2, color: AppColorTheme.primary400),
                    title: const Text('Priority'),
                    trailing: Radio(
                      value: 2,
                      groupValue: 0, // replace with a state variable
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    minTileHeight: -1,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Iconsax.tag, color: AppColorTheme.primary400),
                    title: const Text('Label'),
                    trailing: Radio(
                      value: 3,
                      groupValue: 0, // replace with a state variable
                      onChanged: (value) {},
                    ),
                  ),
                  ListTile(
                    minTileHeight: -1,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Iconsax.clipboard_text, color: AppColorTheme.primary400),
                    title: const Text('Project'),
                    trailing: Radio(
                      value: 4,
                      groupValue: 0, // replace with a state variable
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
