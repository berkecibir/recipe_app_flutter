import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/mixin/home_page_mixin.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/common/common_widgets.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/recipe/recipe_widgets.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/search/search_widgets.dart';

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
      body: GestureDetector(
        onTap: () {
          dismissKeyboard();
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is HomeError) {
              return Center(child: Text(state.error));
            } else if (state is HomeSucces || state is HomeInitial) {
              final recipes = context.read<HomeCubit>().filteredRecipes;
              return Column(
                children: [
                  SearchField(controller: searchController),
                  SearchResultsInfo(resultCount: recipes.length),
                  Expanded(
                    child: recipes.isEmpty
                        ? const EmptyState()
                        : _buildRecipeList(recipes),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildRecipeList(List recipes) {
    return ListView.builder(
      itemCount: recipes.length,
      padding: DevicePadding.small.all,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return RecipeCard(recipe: recipe, index: index);
      },
    );
  }
}
