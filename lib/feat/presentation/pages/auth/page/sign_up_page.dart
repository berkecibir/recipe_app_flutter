import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app_flutter/feat/core/border/app_border_radius.dart';
import 'package:recipe_app_flutter/feat/core/sizes/app_sizes.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_padding/device_padding.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_size/device_size.dart';
import 'package:recipe_app_flutter/feat/core/widgets/device_spacing/device_spacing.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/auth/auth_cubit.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/auth/auth_form_widget.dart';
import 'package:recipe_app_flutter/feat/presentation/widgets/auth/sign_in_row.dart';

class SignUpPage extends StatefulWidget {
  static const String signUpId = AppTexts.signUpPage;
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    return GestureDetector(
      // Dismiss the keyboard on tap
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,

        body: Center(
          child: SingleChildScrollView(
            padding: DevicePadding.xlarge.onlyHorizontal.add(
              DevicePadding.huge.onlyVertical,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo veya başlık
                Icon(
                  Icons.fastfood_rounded,
                  size: AppSizes.colossal,
                  color: Colors.deepOrange,
                ),
                DeviceSpacing.medium.height,
                Text(
                  AppTexts.welcome,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DeviceSpacing.small.height,
                Text(
                  AppTexts.signUpToContinue,
                  style: TextStyle(color: Colors.grey[600]),
                ),
                DeviceSpacing.xlarge.height,
                // Form
                Form(
                  key: authCubit.formKey,
                  child: Column(
                    children: [
                      // Email Field
                      AuthFormWidget.email(authCubit),
                      DeviceSpacing.medium.height,

                      // Password Field
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return AuthFormWidget.password(authCubit);
                        },
                      ),

                      DeviceSpacing.compact.height,
                      // Confirm Password Field
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return AuthFormWidget.confirmPassword(authCubit);
                        },
                      ),

                      DeviceSpacing.medium.height,

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Şifre sıfırlama sayfasına yönlendirme
                          },
                          child: const Text(
                            AppTexts.forgetPassword,
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ),
                      ),
                      DeviceSpacing.xlarge.height,

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: DeviceSize.height! * 0.055,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: AppBorderRadius.circular(
                                AppSizes.tiny,
                              ),
                            ),
                          ),
                          onPressed: () {
                            // Butona basıldığında formu doğrulayın
                            if ((authCubit.formKey.currentState)?.validate() ??
                                false) {
                              authCubit.signUp(
                                context,
                              ); // Form geçerliyse signUp'ı çağırın
                            }
                            //debugPrint('pressed sign up');
                          },
                          child: const Text(AppTexts.signUp),
                        ),
                      ),
                      DeviceSpacing.medium.height,
                      SignInRow(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
