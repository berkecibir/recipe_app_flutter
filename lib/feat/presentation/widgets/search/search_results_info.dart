import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/home/home_cubit.dart';

class SearchResultsInfo extends StatelessWidget {
  final int resultCount;

  const SearchResultsInfo({super.key, required this.resultCount});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    if (cubit.searchQuery.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: DevicePadding.small.onlyHorizontal,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Found $resultCount recipe(s)',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(
              context,
            ).textTheme.bodySmall?.color?.withOpacity(0.7),
          ),
        ),
      ),
    );
  }
}
