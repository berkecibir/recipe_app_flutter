import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';

class HomePage extends StatefulWidget {
  static const String homeId = AppTexts.homePageId;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().fetchRecipes(limit: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipes")),
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
              padding: const EdgeInsets.all(12),
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: recipe.image.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              recipe.image,
                              width: 60,
                              height: 60,
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
                    onTap: () {
                      debugPrint("Recipe tapped: ${recipe.name} and $index ");
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
