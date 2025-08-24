// import 'package:shared_preferences/shared_preferences.dart';
import 'package:recipe_app_flutter/feat/data/service/favorites/in_memory_favorites_service.dart';

class FavoritesService {
  // static const String _favoritesKey = 'favorite_recipes';
  final InMemoryFavoritesService _fallbackService = InMemoryFavoritesService();

  // Get favorite recipe IDs from memory (temporarily disabled shared_preferences)
  Future<List<int>> getFavoriteIds() async {
    return await _fallbackService.getFavoriteIds();
  }

  // Add recipe to favorites
  Future<void> addToFavorites(int recipeId) async {
    await _fallbackService.addToFavorites(recipeId);
  }

  // Remove recipe from favorites
  Future<void> removeFromFavorites(int recipeId) async {
    await _fallbackService.removeFromFavorites(recipeId);
  }

  // Check if recipe is favorite
  Future<bool> isFavorite(int recipeId) async {
    return await _fallbackService.isFavorite(recipeId);
  }

  // Toggle favorite status
  Future<bool> toggleFavorite(int recipeId) async {
    return await _fallbackService.toggleFavorite(recipeId);
  }
}
