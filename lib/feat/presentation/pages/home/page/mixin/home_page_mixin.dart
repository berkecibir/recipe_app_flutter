import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';

mixin HomePageMixin on State<HomePage> {
  late final TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<HomeCubit>().fetchRecipes(limit: 20);
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
