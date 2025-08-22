import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';

mixin HomePageMixin on State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchRecipes(limit: 20);
  }
}
