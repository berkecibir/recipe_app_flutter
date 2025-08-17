import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/sizes/app_sizes.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/auth/auth_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/auth/auth_form_widget.dart';

class SignInPage extends StatefulWidget {
  static const String signInId = AppTexts.signInPage;
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: SingleChildScrollView(
            padding: DevicePadding.xlarge.onlyHorizontal.add(
              DevicePadding.huge.onlyVertical,
            ),

            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fastfood_rounded,
                    size: AppSizes.colossal,
                    color: Colors.deepOrange,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Welcome back\nSign In to continue',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  DeviceSpacing.medium.height,
                  AuthFormWidget.email(authCubit),
                  DeviceSpacing.medium.height,
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      return AuthFormWidget.password(authCubit);
                    },
                  ),

                  DeviceSpacing.medium.height,
                  ElevatedButton(
                    onPressed: () {
                      /* if (authCubit.formKey.currentState?.validate() ?? false) {
                        authCubit.signUp(context);
                      } */
                    },
                    child: const Text(AppTexts.signIn),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
