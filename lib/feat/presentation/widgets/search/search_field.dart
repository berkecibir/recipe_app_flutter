import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final VoidCallback? onClear;

  const SearchField({
    super.key,
    required this.controller,
    this.hintText = 'Search recipes, ingredients, cuisine...',
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DevicePadding.small.all,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return TextField(
            controller: controller,
            onChanged: (value) {
              cubit.searchRecipes(value);
            },
            decoration:
                const InputDecoration(
                  hintText: 'Search recipes, ingredients, cuisine...',
                  prefixIcon: Icon(Icons.search),
                ).copyWith(
                  suffixIcon: cubit.searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            controller.clear();
                            cubit.clearSearch();
                            onClear?.call();
                          },
                        )
                      : null,
                ),
          );
        },
      ),
    );
  }
}
