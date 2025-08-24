import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';

mixin HomePageMixin on State<HomePage> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<HomeCubit>().fetchRecipes(limit: 20);
    context.read<FavoritesCubit>().loadFavoriteIds();
    _setupListeners();
  }

  void _setupListeners() {
    // Listen to home cubit state changes to update favorites
    context.read<HomeCubit>().stream.listen((homeState) {
      if (homeState is HomeSucces && mounted) {
        final homeCubit = context.read<HomeCubit>();
        final favoritesCubit = context.read<FavoritesCubit>();
        favoritesCubit.setAllRecipes(homeCubit.recipes);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void dismissKeyboard() {
    FocusScope.of(context).unfocus();
  }
}
