import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:recipe_app_flutter/feat/data/service/auth/user_service.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/auth/auth_cubit.dart';

class BlocProvidersSetUp {
  static List<SingleChildWidget> providers = <SingleChildWidget>[
    BlocProvider<AuthCubit>(create: (_) => AuthCubit(UserService())),
  ];
}
