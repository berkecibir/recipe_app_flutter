import 'package:dio/dio.dart';
import 'package:recipe_app_flutter/feat/core/exception/recipe_exception.dart';
import 'package:recipe_app_flutter/feat/data/recipe_response/recipe_response.dart';
import 'package:recipe_app_flutter/feat/data/service/recipe_service/i_recipe_service.dart';

class RecipeService implements IRecipeService {
  static const String _baseUrl = 'https://dummyjson.com/recipes';
  late final Dio _dio;

  RecipeService() {
    _dio = Dio();
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 10);
    _dio.options.receiveTimeout = const Duration(seconds: 10);
  }

  @override
  Future<RecipeResponse> fetchRecipes({int? limit, int? skip}) async {
    try {
      String url = _baseUrl;
      if (limit != null || skip != null) {
        url += '?';
        if (limit != null) url += 'limit=$limit';
        if (skip != null) url += '${limit != null ? '&' : ''}skip=$skip';
      }

      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        return RecipeResponse.fromJson(response.data);
      } else {
        throw RecipeServiceException('HTTP Error: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw RecipeServiceException('Network Error: ${e.message}');
    } catch (e) {
      throw RecipeServiceException('Unexpected Error: $e');
    }
  }
}
