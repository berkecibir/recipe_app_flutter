import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/border/app_border_radius.dart';
import 'package:recipe_app_flutter/feat/core/sizes/app_sizes.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/data/model/recipe/recipe_model.dart';

class RecipeCard extends StatelessWidget {
  final RecipeModel recipe;
  final int index;
  final VoidCallback? onTap;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.index,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping on card
        FocusScope.of(context).unfocus();

        // Execute custom onTap if provided
        onTap?.call();

        // Default behavior - navigate to recipe details
        debugPrint("Recipe tapped: ${recipe.name} and index: ${index + 1}");
      },
      child: Card(
        elevation: 5,
        margin: DevicePadding.small.onlyVertical,
        shape: RoundedRectangleBorder(
          borderRadius: AppBorderRadius.circular(AppSizes.base),
        ),
        child: ListTile(
          contentPadding: DevicePadding.small.all,
          leading: _buildRecipeImage(),
          title: _buildRecipeTitle(context),
          subtitle: _buildRecipeDetails(),
        ),
      ),
    );
  }

  Widget _buildRecipeImage() {
    return recipe.image.isNotEmpty
        ? ClipRRect(
            borderRadius: AppBorderRadius.all(AppSizes.base),
            child: Image.network(
              recipe.image,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const CircleAvatar(child: Icon(Icons.fastfood));
              },
            ),
          )
        : const CircleAvatar(child: Icon(Icons.fastfood));
  }

  Widget _buildRecipeTitle(BuildContext context) {
    return Text(
      recipe.name,
      style: Theme.of(
        context,
      ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildRecipeDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.extraTiny),
        Text("Prep Time: ${recipe.prepTimeMinutes} min"),
        Text("Cook Time: ${recipe.cookTimeMinutes} min"),
        Text("Difficulty: ${recipe.difficulty}"),
        Text("Cuisine: ${recipe.cuisine}"),
        Text("⭐ ${recipe.rating}  (${recipe.reviewCount} reviews)"),
      ],
    );
  }
}
