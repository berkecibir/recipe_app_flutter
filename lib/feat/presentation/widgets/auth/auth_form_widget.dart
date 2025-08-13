import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/border/app_border_radius.dart';
import 'package:recipe_app_flutter/feat/core/sizes/app_sizes.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/utils/validator/form_validator.dart';
import 'package:recipe_app_flutter/feat/presentation/cubit/cubit/auth_cubit.dart';

class AuthFormWidget extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final bool isObscure;
  final Icon prefix;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  const AuthFormWidget({
    super.key,
    this.validator,
    required this.labelText,
    required this.isObscure,
    required this.prefix,
    required this.controller,
    this.suffixIcon,
    this.keyboardType,
  });

  /// Email factory
  factory AuthFormWidget.email(AuthCubit authCubit) {
    return AuthFormWidget(
      validator: FormValidator.validateEmail,
      controller: authCubit.emailController,
      labelText: AppTexts.email,
      isObscure: false,
      prefix: Icon(Icons.email),
      keyboardType: TextInputType.emailAddress,
    );
  }

  /// Password factory
  factory AuthFormWidget.password(AuthCubit cubit) {
    return AuthFormWidget(
      labelText: AppTexts.password,
      isObscure: cubit.isPasswordObscured,
      prefix: Icon(Icons.lock_outline),
      controller: cubit.passwordController,
      validator: (value) => FormValidator.validatePassword(value, minLength: 6),
      suffixIcon: IconButton(
        icon: Icon(
          cubit.isPasswordObscured ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: cubit.togglePasswordVisibility,
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  factory AuthFormWidget.confirmPassword(AuthCubit cubit) {
    return AuthFormWidget(
      labelText: AppTexts.confirmPassword,
      isObscure: cubit.isConfirmPasswordObscured,
      prefix: Icon(Icons.lock_outline),
      controller: cubit.confirmPasswordController,
      validator: (value) => FormValidator.validateConfirmPassword(
        value,
        cubit.passwordController.text,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          cubit.isConfirmPasswordObscured
              ? Icons.visibility_off
              : Icons.visibility,
        ),
        onPressed: cubit.toggleConfirmPasswordVisibility,
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: prefix,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.circular(AppSizes.tiny),
        ),
        suffixIcon: suffixIcon,
      ),
      validator: validator,
    );
  }
}
