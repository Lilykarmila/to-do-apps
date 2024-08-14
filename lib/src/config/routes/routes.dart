import 'package:flutter/material.dart';
import 'package:to_do_apps/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:to_do_apps/src/features/auth/sign_up/presentation/pages/sign_up_page.dart';
import 'package:to_do_apps/src/features/dasshboard/presentation/pages/dashboard_page.dart';
import 'package:to_do_apps/src/features/main/calendar/presentation/pages/calendar_page.dart';
import 'package:to_do_apps/src/features/main/my_task/presentation/pages/my_task.page.dart';
import 'package:to_do_apps/src/features/notification/presentation/pages/notification.page.dart';
import 'package:to_do_apps/src/features/splash_screen/presentation/pages/splash_page.dart';

import '../../features/main/root/presentation/page/root_pages.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.routeName:
        return _materialRoute(const SplashPage());
      case LoginPage.routeName:
        return _materialRoute(const LoginPage());
      case SignUpPage.routeName:
        return _materialRoute(const SignUpPage());
      case RootPage.routeName:
        return _materialRoute(const RootPage());
      case MyTaskPage.routeName:
        return _materialRoute(const MyTaskPage());
      case MyCalendarPage.routeName:
        return _materialRoute(const MyCalendarPage());
      case NotificationPage.routeName:
        return _materialRoute(const NotificationPage());
      case DashboardPage.routeName:
        return _materialRoute(const DashboardPage());
      default:
        return _materialRoute(const SplashPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
