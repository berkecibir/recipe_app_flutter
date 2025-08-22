import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  factory CustomAppBar.homeAppBar() {
    return const CustomAppBar(title: AppTexts.homeAppBarTitle);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
