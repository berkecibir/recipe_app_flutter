import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/init/app_init.dart';
import 'package:recipe_app_flutter/feat/core/widgets/navigation_helper/navigation_helper.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppInit.initDeviceSize(context);
    return MaterialApp(
      title: 'Recipe App',
      navigatorKey: Navigation.navigationKey,
    );
  }
}
