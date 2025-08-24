class InMemoryFavoritesService {
  static final Set<int> _favoriteIds = <int>{};

  // Get favorite recipe IDs from memory
  Future<List<int>> getFavoriteIds() async {
    return _favoriteIds.toList();
  }

  // Add recipe to favorites
  Future<void> addToFavorites(int recipeId) async {
    _favoriteIds.add(recipeId);
  }

  // Remove recipe from favorites
  Future<void> removeFromFavorites(int recipeId) async {
    _favoriteIds.remove(recipeId);
  }

  // Check if recipe is favorite
  Future<bool> isFavorite(int recipeId) async {
    return _favoriteIds.contains(recipeId);
  }

  // Toggle favorite status
  Future<bool> toggleFavorite(int recipeId) async {
    final isFav = _favoriteIds.contains(recipeId);

    if (isFav) {
      _favoriteIds.remove(recipeId);
      return false;
    } else {
      _favoriteIds.add(recipeId);
      return true;
    }
  }
}
