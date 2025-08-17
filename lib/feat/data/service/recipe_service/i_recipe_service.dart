import 'package:recipe_app_flutter/feat/data/recipe_response/recipe_response.dart';

abstract class IRecipeService {
  Future<RecipeResponse> fetchRecipes({int? limit, int? skip});
}
