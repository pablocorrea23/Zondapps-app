// ignore_for_file: file_names, constant_identifier_names, unreachable_switch_case

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zondapps_flutter/Pages/LoginPage/LoginPage.dart';
import 'package:zondapps_flutter/Pages/Home/MyHomePage.dart';
import 'package:zondapps_flutter/Pages/NotificationsPage.dart';
import 'package:zondapps_flutter/Pages/ProfilePage.dart';

const String ROUTE_LOGIN = '/login';
const String ROUTE_HOME = '/home';
const String ROUTE_NOTIFICATIONS = '/notifications';
const String ROUTE_PROFILE = '/profile';

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return PageTransition(child: const LoginPage(), type: PageTransitionType.leftToRight, 
        settings: settings, alignment: Alignment.topLeft);
      case '/home':
        return PageTransition(child: const MyHomePage(), type: PageTransitionType.leftToRight, 
        settings: settings, alignment: Alignment.topLeft);
      case '/notifications':
        return PageTransition(child: const NotificationsPage(), type: PageTransitionType.leftToRight, 
        settings: settings, alignment: Alignment.topLeft);
      case '/profile':
        return PageTransition(child: const ProfilePage(), type: PageTransitionType.leftToRight, 
        settings: settings, alignment: Alignment.topLeft);
      default:
      return PageTransition(child: const LoginPage(), type: PageTransitionType.leftToRight, 
        settings: settings, alignment: Alignment.topLeft);
    }
  }
}
