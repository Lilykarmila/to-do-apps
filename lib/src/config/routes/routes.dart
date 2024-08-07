import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/sign_in_page.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return _materialRoute(const LoginPage());
      case SignUpPage.routeName:
        return _materialRoute(const SignUpPage());
      default:
        return _materialRoute(const SignUpPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
