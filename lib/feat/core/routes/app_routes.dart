import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/presentation/home/page/home_page.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/auth/page/sign_in_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignUpPage.signInId: (context) => const SignUpPage(),
    HomePage.homeId: (context) => const HomePage(),
  };
}
