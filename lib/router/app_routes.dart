import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/pages/login.dart';
import 'package:tg_softwareapp/pages/restaurar_password_page.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';

class AppRoutes {
  static const initialRouter = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const Login(),
    'restaurarPassword': (BuildContext context) =>
        const RestaurarPasswordPage(),
    'registerPage': (BuildContext context) => const RegisterPage(),
    'homePage': (BuildContext context) => const HomePage(),
    'profilePage': (BuildContext context) => const ProfilePage(),
  };
  static onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const Login());
  }
}
