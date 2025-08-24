import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/auth/page/sign_in_page.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/favorites/page/favorites_page.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/auth/page/sign_up_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SignUpPage.signUpId: (context) => const SignUpPage(),
    SignInPage.signInId: (context) => const SignInPage(),
    HomePage.homeId: (context) => const HomePage(),
    FavoritesPage.favoritesId: (context) => const FavoritesPage(),
  };
}
