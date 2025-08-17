import 'package:recipe_app_flutter/feat/core/exception/recipe_exception.dart';
import 'package:recipe_app_flutter/feat/data/recipe_response/recipe_response.dart';
import 'package:recipe_app_flutter/feat/data/repository/recipe/i_recipe_repository.dart';
import 'package:recipe_app_flutter/feat/data/service/recipe_service/i_recipe_service.dart';

class RecipeRepositoryImpl implements IRecipeRepository {
  final IRecipeService _recipeService;

  RecipeRepositoryImpl({required IRecipeService recipeService})
    : _recipeService = recipeService;
  @override
  Future<RecipeResponse> fetchRecipes({int? limit, int? skip}) async {
    try {
      return await _recipeService.fetchRecipes(limit: limit, skip: skip);
    } on RecipeServiceException {
      rethrow;
    } catch (e) {
      throw RecipeServiceException('Repository Error: $e');
    }
  }
}
