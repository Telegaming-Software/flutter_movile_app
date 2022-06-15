import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tg_softwareapp/pages/edit_profile_page.dart';
import 'package:tg_softwareapp/pages/login.dart';
import 'package:tg_softwareapp/pages/material_info_page.dart';
import 'package:tg_softwareapp/pages/materiales_page.dart';
import 'package:tg_softwareapp/pages/restaurar_password_page.dart';
import 'package:tg_softwareapp/pages/select_type_user_login.dart';
import 'package:tg_softwareapp/pages/splash_screen.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';
import '../pages/register_page.dart';

class AppRoutes {
  static const initialRouter = 'splashscreen';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const Login(),
    'restaurarPassword': (BuildContext context) =>
        const RestaurarPasswordPage(),
    'registerPage': (BuildContext context) => const RegisterPage(),
    'homePage': (BuildContext context) => const HomePage(),
    'profilePage': (BuildContext context) => const ProfilePage(),
    'profileEditPage': (BuildContext context) => const EditProfilePage(),
    'materialInfoPage': (BuildContext context) => const MaterialInfoPage(),
    'splashscreen': (BuildContext context) => const SplashScreen(),
    'selectTypeUser': (BuildContext context) => const SelectTypeScreen(),
  };
  static onGeneratedRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const Login());
  }
}
