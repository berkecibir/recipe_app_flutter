import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/favorites/page/favorites_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  factory CustomAppBar.homeAppBar() {
    return const CustomAppBar(
      title: AppTexts.homeAppBarTitle,
      actions: [_FavoritesButton()],
    );
  }

  factory CustomAppBar.favoritesAppBar() {
    return const CustomAppBar(title: AppTexts.favoritesAppBarTitle);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title), actions: actions);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FavoritesButton extends StatelessWidget {
  const _FavoritesButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.favorite),
      onPressed: () {
        Navigation.push(page: const FavoritesPage());
      },
    );
  }
}
