import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';
import 'package:recipe_app_flutter/feat/data/service/recipe_service/recipe_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final RecipeService _recipeService;
  HomeCubit(this._recipeService) : super(HomeInitial());

  List<RecipeModel> recipes = [];
  List<RecipeModel> filteredRecipes = [];
  String searchQuery = '';

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
      filteredRecipes = recipes; // Initialize filtered recipes
      emit(HomeSucces("Recipes loaded successfully"));
    } catch (e) {
      emit(HomeError(error: e.toString()));
    }
  }

  void searchRecipes(String query) {
    searchQuery = query.toLowerCase();
    if (searchQuery.isEmpty) {
      filteredRecipes = recipes;
    } else {
      filteredRecipes = recipes.where((recipe) {
        return recipe.name.toLowerCase().contains(searchQuery) ||
            recipe.cuisine.toLowerCase().contains(searchQuery) ||
            recipe.difficulty.toLowerCase().contains(searchQuery) ||
            recipe.tags.any((tag) => tag.toLowerCase().contains(searchQuery)) ||
            recipe.ingredients.any(
              (ingredient) => ingredient.toLowerCase().contains(searchQuery),
            );
      }).toList();
    }
    emit(HomeSucces("Search completed"));
  }

  void clearSearch() {
    searchQuery = '';
    filteredRecipes = recipes;
    emit(HomeSucces("Search cleared"));
  }
}
