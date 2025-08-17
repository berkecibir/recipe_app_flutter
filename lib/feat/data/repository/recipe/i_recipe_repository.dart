import 'package:recipe_app_flutter/feat/data/recipe_response/recipe_response.dart';

abstract class IRecipeRepository {
  Future<RecipeResponse> fetchRecipes({int? limit, int? skip});
}
