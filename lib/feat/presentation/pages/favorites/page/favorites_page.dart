import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/favorites/favorites_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/common/common_widgets.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/recipe/recipe_widgets.dart';

class FavoritesPage extends StatefulWidget {
  static const String favoritesId = AppTexts.favoritesPageId;

  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    // Load favorite recipes when page is opened
    final favoritesCubit = context.read<FavoritesCubit>();
    favoritesCubit.loadFavoriteIds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.favoritesAppBar(),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is FavoritesError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${state.message}',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (state is FavoritesLoaded) {
            final favoritesCubit = context.read<FavoritesCubit>();
            final favoriteRecipes = favoritesCubit.favoriteRecipes;

            if (favoriteRecipes.isEmpty) {
              return const EmptyState(
                title: 'No favorite recipes yet',
                subtitle: 'Add some recipes to your favorites to see them here',
                icon: Icons.favorite_border,
              );
            }

            return ListView.builder(
              itemCount: favoriteRecipes.length,
              padding: DevicePadding.small.all,
              itemBuilder: (context, index) {
                final recipe = favoriteRecipes[index];
                return RecipeCard(
                  recipe: recipe,
                  index: index,
                  onTap: () {
                    debugPrint("Navigate to recipe detail: ${recipe.name}");
                  },
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
