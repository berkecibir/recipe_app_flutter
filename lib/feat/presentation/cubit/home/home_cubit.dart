import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';
import 'package:recipe_app_flutter/feat/data/service/recipe_service/recipe_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RecipeService _recipeService;
  HomeCubit(this._recipeService) : super(HomeInitial());

  List<RecipeModel> recipes = [];

  Future<void> fetchRecipes({int? limit, int? skip}) async {
    emit(HomeLoading());
    try {
      final response = await _recipeService.fetchRecipes(
        limit: limit,
        skip: skip,
      );
      if (response.recipes.isEmpty) {
        emit(HomeError(error: 'No recipes found'));
        return;
      }
      recipes = response.recipes; // 👈 eksik olan kısım
      emit(HomeSucces("Recipes loaded successfully"));
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }
}
