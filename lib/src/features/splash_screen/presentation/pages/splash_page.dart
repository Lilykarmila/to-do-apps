import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_apps/src/core/utils/auth_service.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:to_do_apps/src/features/main/root/presentation/page/root_pages.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/splash-page';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    await Future.delayed(const Duration(seconds: 3)); // Delay sebelum pengecekan login
    if (!mounted) return;

    final bool isLoggedIn = await AuthService.isLoggedIn();
    if (!mounted) return;

    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, RootPage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/login.png',
              width: 180,
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
