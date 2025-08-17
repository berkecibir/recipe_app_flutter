class RecipeServiceException implements Exception {
  final String message;
  RecipeServiceException(this.message);

  @override
  String toString() => 'RecipeServiceException: $message';
}
