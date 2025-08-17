import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/config/theme/app_theme.dart';
import 'package:recipe_app_flutter/feat/core/init/app_init.dart';
import 'package:recipe_app_flutter/feat/core/routes/app_routes.dart';
import 'package:recipe_app_flutter/feat/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';
import 'package:recipe_app_flutter/feat/providers/bloc_provider_set_up.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppInit.initDeviceSize(context);
    return MultiBlocProvider(
      providers: BlocProvidersSetUp.providers,
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        title: 'Recipe App',
        initialRoute: HomePage.homeId,
        routes: AppRoutes.routes,
        navigatorKey: Navigation.navigationKey,
      ),
    );
  }
}
