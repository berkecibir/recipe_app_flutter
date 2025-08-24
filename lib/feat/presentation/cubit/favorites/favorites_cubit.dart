import 'package:bloc/bloc.dart';
import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';
import 'package:recipe_app_flutter/feat/data/service/favorites/favorites_service.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesService _favoritesService;

  FavoritesCubit(this._favoritesService) : super(FavoritesInitial());

  List<RecipeModel> favoriteRecipes = [];
  List<int> favoriteIds = [];

  // Load favorite IDs from storage
  Future<void> loadFavoriteIds() async {
    try {
      favoriteIds = await _favoritesService.getFavoriteIds();
      emit(FavoritesLoaded(favoriteIds));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  // Update favorite recipes list
  void updateFavoriteRecipes(List<RecipeModel> allRecipes) {
    favoriteRecipes = allRecipes
        .where((recipe) => favoriteIds.contains(recipe.id))
        .toList();
    emit(FavoritesLoaded(favoriteIds));
  }

  // Set all recipes and update favorites
  void setAllRecipes(List<RecipeModel> allRecipes) {
    updateFavoriteRecipes(allRecipes);
  }

  // Toggle favorite status
  Future<void> toggleFavorite(RecipeModel recipe) async {
    try {
      final newStatus = await _favoritesService.toggleFavorite(recipe.id);

      if (newStatus) {
        favoriteIds.add(recipe.id);
        favoriteRecipes.add(recipe);
      } else {
        favoriteIds.remove(recipe.id);
        favoriteRecipes.removeWhere((r) => r.id == recipe.id);
      }

      emit(FavoritesLoaded(favoriteIds));
    } catch (e) {
      emit(FavoritesError(e.toString()));
    }
  }

  // Check if recipe is favorite
  bool isFavorite(int recipeId) {
    return favoriteIds.contains(recipeId);
  }
}
