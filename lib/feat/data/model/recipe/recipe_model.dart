class RecipeModel {
  final int id;
  final String name;
  final List<String> ingredients;
  final List<String> instructions;
  final int prepTimeMinutes;
  final int cookTimeMinutes;
  final int servings;
  final String difficulty;
  final String cuisine;
  final int caloriesPerServing;
  final List<String> tags;
  final int userId;
  final String image;
  final double rating;
  final int reviewCount;
  final List<String> mealType;
  final bool isFavorite;

  RecipeModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
    this.isFavorite = false,
  });

  // CopyWith method for creating updated instances
  RecipeModel copyWith({
    int? id,
    String? name,
    List<String>? ingredients,
    List<String>? instructions,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    int? servings,
    String? difficulty,
    String? cuisine,
    int? caloriesPerServing,
    List<String>? tags,
    int? userId,
    String? image,
    double? rating,
    int? reviewCount,
    List<String>? mealType,
    bool? isFavorite,
  }) {
    return RecipeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
      prepTimeMinutes: prepTimeMinutes ?? this.prepTimeMinutes,
      cookTimeMinutes: cookTimeMinutes ?? this.cookTimeMinutes,
      servings: servings ?? this.servings,
      difficulty: difficulty ?? this.difficulty,
      cuisine: cuisine ?? this.cuisine,
      caloriesPerServing: caloriesPerServing ?? this.caloriesPerServing,
      tags: tags ?? this.tags,
      userId: userId ?? this.userId,
      image: image ?? this.image,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      mealType: mealType ?? this.mealType,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // Helper functions for type-safe parsing
  static double _toDouble(dynamic v) {
    if (v == null) return 0.0;
    if (v is double) return v;
    if (v is int) return v.toDouble();
    if (v is num) return v.toDouble();
    if (v is String) return double.tryParse(v) ?? 0.0;

    return 0.0;
  }

  static int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;

    return 0;
  }

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    List<String> toStringList(dynamic src) {
      if (src == null) return <String>[];

      return (src as List).map((e) => e.toString()).toList();
    }

    return RecipeModel(
      id: _toInt(json['id']),
      name: (json['name'] ?? '') as String,
      ingredients: toStringList(json['ingredients']),
      instructions: toStringList(json['instructions']),
      prepTimeMinutes: _toInt(json['prepTimeMinutes']),
      cookTimeMinutes: _toInt(json['cookTimeMinutes']),
      servings: _toInt(json['servings']),
      difficulty: (json['difficulty'] ?? '') as String,
      cuisine: (json['cuisine'] ?? '') as String,
      caloriesPerServing: _toInt(json['caloriesPerServing']),
      tags: toStringList(json['tags']),
      userId: _toInt(json['userId']),
      image: (json['image'] ?? '') as String,
      rating: _toDouble(json['rating']),
      reviewCount: _toInt(json['reviewCount']),
      mealType: toStringList(json['mealType']),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'ingredients': ingredients,
    'instructions': instructions,
    'prepTimeMinutes': prepTimeMinutes,
    'cookTimeMinutes': cookTimeMinutes,
    'servings': servings,
    'difficulty': difficulty,
    'cuisine': cuisine,
    'caloriesPerServing': caloriesPerServing,
    'tags': tags,
    'userId': userId,
    'image': image,
    'rating': rating,
    'reviewCount': reviewCount,
    'mealType': mealType,
    'isFavorite': isFavorite,
  };
}
