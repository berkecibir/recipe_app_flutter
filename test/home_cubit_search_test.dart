import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';
import 'package:recipe_app_flutter/feat/data/recipe_response/recipe_response.dart';
import 'package:recipe_app_flutter/feat/data/service/recipe_service/recipe_service.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';

class MockRecipeService extends Mock implements RecipeService {}

void main() {
  group('HomeCubit Search Tests', () {
    late HomeCubit homeCubit;
    late MockRecipeService mockRecipeService;

    setUp(() {
      mockRecipeService = MockRecipeService();
      homeCubit = HomeCubit(mockRecipeService);
    });

    tearDown(() {
      homeCubit.close();
    });

    test('should filter recipes by name', () async {
      // Arrange
      final testRecipes = [
        RecipeModel(
          id: 1,
          name: 'Chocolate Cake',
          ingredients: ['flour', 'chocolate'],
          instructions: ['mix', 'bake'],
          prepTimeMinutes: 30,
          cookTimeMinutes: 45,
          servings: 8,
          difficulty: 'Medium',
          cuisine: 'American',
          caloriesPerServing: 350,
          tags: ['dessert'],
          userId: 1,
          image: '',
          rating: 4.5,
          reviewCount: 100,
          mealType: ['Dessert'],
        ),
        RecipeModel(
          id: 2,
          name: 'Pizza Margherita',
          ingredients: ['dough', 'tomato', 'mozzarella'],
          instructions: ['roll', 'top', 'bake'],
          prepTimeMinutes: 20,
          cookTimeMinutes: 15,
          servings: 4,
          difficulty: 'Easy',
          cuisine: 'Italian',
          caloriesPerServing: 250,
          tags: ['main'],
          userId: 1,
          image: '',
          rating: 4.8,
          reviewCount: 150,
          mealType: ['Lunch', 'Dinner'],
        ),
      ];

      when(
        () => mockRecipeService.fetchRecipes(
          limit: any(named: 'limit'),
          skip: any(named: 'skip'),
        ),
      ).thenAnswer(
        (_) async => RecipeResponse(
          recipes: testRecipes,
          total: testRecipes.length,
          skip: 0,
          limit: 20,
        ),
      );

      // Act
      await homeCubit.fetchRecipes(limit: 20);
      homeCubit.searchRecipes('chocolate');

      // Assert
      expect(homeCubit.filteredRecipes.length, 1);
      expect(homeCubit.filteredRecipes.first.name, 'Chocolate Cake');
    });

    test('should filter recipes by cuisine', () async {
      // Arrange
      final testRecipes = [
        RecipeModel(
          id: 1,
          name: 'Chocolate Cake',
          ingredients: ['flour', 'chocolate'],
          instructions: ['mix', 'bake'],
          prepTimeMinutes: 30,
          cookTimeMinutes: 45,
          servings: 8,
          difficulty: 'Medium',
          cuisine: 'American',
          caloriesPerServing: 350,
          tags: ['dessert'],
          userId: 1,
          image: '',
          rating: 4.5,
          reviewCount: 100,
          mealType: ['Dessert'],
        ),
        RecipeModel(
          id: 2,
          name: 'Pizza Margherita',
          ingredients: ['dough', 'tomato', 'mozzarella'],
          instructions: ['roll', 'top', 'bake'],
          prepTimeMinutes: 20,
          cookTimeMinutes: 15,
          servings: 4,
          difficulty: 'Easy',
          cuisine: 'Italian',
          caloriesPerServing: 250,
          tags: ['main'],
          userId: 1,
          image: '',
          rating: 4.8,
          reviewCount: 150,
          mealType: ['Lunch', 'Dinner'],
        ),
      ];

      when(
        () => mockRecipeService.fetchRecipes(
          limit: any(named: 'limit'),
          skip: any(named: 'skip'),
        ),
      ).thenAnswer(
        (_) async => RecipeResponse(
          recipes: testRecipes,
          total: testRecipes.length,
          skip: 0,
          limit: 20,
        ),
      );

      // Act
      await homeCubit.fetchRecipes(limit: 20);
      homeCubit.searchRecipes('italian');

      // Assert
      expect(homeCubit.filteredRecipes.length, 1);
      expect(homeCubit.filteredRecipes.first.name, 'Pizza Margherita');
    });

    test('should filter recipes by ingredients', () async {
      // Arrange
      final testRecipes = [
        RecipeModel(
          id: 1,
          name: 'Chocolate Cake',
          ingredients: ['flour', 'chocolate'],
          instructions: ['mix', 'bake'],
          prepTimeMinutes: 30,
          cookTimeMinutes: 45,
          servings: 8,
          difficulty: 'Medium',
          cuisine: 'American',
          caloriesPerServing: 350,
          tags: ['dessert'],
          userId: 1,
          image: '',
          rating: 4.5,
          reviewCount: 100,
          mealType: ['Dessert'],
        ),
        RecipeModel(
          id: 2,
          name: 'Pizza Margherita',
          ingredients: ['dough', 'tomato', 'mozzarella'],
          instructions: ['roll', 'top', 'bake'],
          prepTimeMinutes: 20,
          cookTimeMinutes: 15,
          servings: 4,
          difficulty: 'Easy',
          cuisine: 'Italian',
          caloriesPerServing: 250,
          tags: ['main'],
          userId: 1,
          image: '',
          rating: 4.8,
          reviewCount: 150,
          mealType: ['Lunch', 'Dinner'],
        ),
      ];

      when(
        () => mockRecipeService.fetchRecipes(
          limit: any(named: 'limit'),
          skip: any(named: 'skip'),
        ),
      ).thenAnswer(
        (_) async => RecipeResponse(
          recipes: testRecipes,
          total: testRecipes.length,
          skip: 0,
          limit: 20,
        ),
      );

      // Act
      await homeCubit.fetchRecipes(limit: 20);
      homeCubit.searchRecipes('mozzarella');

      // Assert
      expect(homeCubit.filteredRecipes.length, 1);
      expect(homeCubit.filteredRecipes.first.name, 'Pizza Margherita');
    });

    test('should return all recipes when search is cleared', () async {
      // Arrange
      final testRecipes = [
        RecipeModel(
          id: 1,
          name: 'Chocolate Cake',
          ingredients: ['flour', 'chocolate'],
          instructions: ['mix', 'bake'],
          prepTimeMinutes: 30,
          cookTimeMinutes: 45,
          servings: 8,
          difficulty: 'Medium',
          cuisine: 'American',
          caloriesPerServing: 350,
          tags: ['dessert'],
          userId: 1,
          image: '',
          rating: 4.5,
          reviewCount: 100,
          mealType: ['Dessert'],
        ),
        RecipeModel(
          id: 2,
          name: 'Pizza Margherita',
          ingredients: ['dough', 'tomato', 'mozzarella'],
          instructions: ['roll', 'top', 'bake'],
          prepTimeMinutes: 20,
          cookTimeMinutes: 15,
          servings: 4,
          difficulty: 'Easy',
          cuisine: 'Italian',
          caloriesPerServing: 250,
          tags: ['main'],
          userId: 1,
          image: '',
          rating: 4.8,
          reviewCount: 150,
          mealType: ['Lunch', 'Dinner'],
        ),
      ];

      when(
        () => mockRecipeService.fetchRecipes(
          limit: any(named: 'limit'),
          skip: any(named: 'skip'),
        ),
      ).thenAnswer(
        (_) async => RecipeResponse(
          recipes: testRecipes,
          total: testRecipes.length,
          skip: 0,
          limit: 20,
        ),
      );

      // Act
      await homeCubit.fetchRecipes(limit: 20);
      homeCubit.searchRecipes('chocolate');
      homeCubit.clearSearch();

      // Assert
      expect(homeCubit.filteredRecipes.length, 2);
      expect(homeCubit.searchQuery, '');
    });

    test('should return empty list when no recipes match search', () async {
      // Arrange
      final testRecipes = [
        RecipeModel(
          id: 1,
          name: 'Chocolate Cake',
          ingredients: ['flour', 'chocolate'],
          instructions: ['mix', 'bake'],
          prepTimeMinutes: 30,
          cookTimeMinutes: 45,
          servings: 8,
          difficulty: 'Medium',
          cuisine: 'American',
          caloriesPerServing: 350,
          tags: ['dessert'],
          userId: 1,
          image: '',
          rating: 4.5,
          reviewCount: 100,
          mealType: ['Dessert'],
        ),
      ];

      when(
        () => mockRecipeService.fetchRecipes(
          limit: any(named: 'limit'),
          skip: any(named: 'skip'),
        ),
      ).thenAnswer(
        (_) async => RecipeResponse(
          recipes: testRecipes,
          total: testRecipes.length,
          skip: 0,
          limit: 20,
        ),
      );

      // Act
      await homeCubit.fetchRecipes(limit: 20);
      homeCubit.searchRecipes('sushi');

      // Assert
      expect(homeCubit.filteredRecipes.length, 0);
    });
  });
}
