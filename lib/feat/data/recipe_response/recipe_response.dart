import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';

class RecipeResponse {
  final List<RecipeModel> recipes;
  final int total;
  final int skip;
  final int limit;

  RecipeResponse({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeResponse.fromJson(Map<String, dynamic> json) {
    return RecipeResponse(
      recipes:
          (json['recipes'] as List<dynamic>?)
              ?.map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          <RecipeModel>[],
      total: _toInt(json['total']),
      skip: _toInt(json['skip']),
      limit: _toInt(json['limit']),
    );
  }

  static int _toInt(dynamic v) {
    if (v == null) return 0;
    if (v is int) return v;
    if (v is double) return v.toInt();
    if (v is num) return v.toInt();
    if (v is String) return int.tryParse(v) ?? 0;
    return 0;
  }
}
