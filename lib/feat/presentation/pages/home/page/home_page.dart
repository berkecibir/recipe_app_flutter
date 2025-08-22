import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/border/app_border_radius.dart';
import 'package:recipe_app_flutter/feat/core/sizes/app_sizes.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/mixin/home_page_mixin.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/appbar/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  static const String homeId = AppTexts.homePageId;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.homeAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is HomeError) {
            return Center(child: Text(state.error));
          } else if (state is HomeSucces || state is HomeInitial) {
            final recipes = context.read<HomeCubit>().recipes;
            return ListView.builder(
              itemCount: recipes.length,
              padding: DevicePadding.small.all,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to recipe details page
                    debugPrint(
                      "Recipe tapped: ${recipe.name} and ${index = index + 1} ",
                    );
                  },
                  child: Card(
                    elevation: 5,
                    margin: DevicePadding.small.onlyVertical,
                    shape: RoundedRectangleBorder(
                      borderRadius: AppBorderRadius.circular(AppSizes.base),
                    ),
                    child: ListTile(
                      contentPadding: DevicePadding.small.all,
                      leading: recipe.image.isNotEmpty
                          ? ClipRRect(
                              borderRadius: AppBorderRadius.all(AppSizes.base),
                              child: Image.network(
                                recipe.image,
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            )
                          : const CircleAvatar(child: Icon(Icons.fastfood)),
                      title: Text(
                        recipe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text("Prep Time: ${recipe.prepTimeMinutes} min"),
                          Text("Cook Time: ${recipe.cookTimeMinutes} min"),
                          Text("Difficulty: ${recipe.difficulty}"),
                          Text("Cuisine: ${recipe.cuisine}"),
                          Text(
                            "⭐ ${recipe.rating}  (${recipe.reviewCount} reviews)",
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
