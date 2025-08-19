import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/core/duration/app_duration.dart';
import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';
import 'package:recipe_app_flutter/feat/core/widgets/navigation_helper/navigation_helper.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_model.dart';
import 'package:recipe_app_flutter/feat/data/service/auth/user_service.dart';
import 'package:recipe_app_flutter/feat/presentation/pages/home/page/home_page.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(AuthInitial());
  final UserService _authService;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;

  void togglePasswordVisibility() {
    isPasswordObscured = !isPasswordObscured;
    emit(
      AuthPasswordVisibilityChanged(
        isPasswordObscured,
        isConfirmPasswordObscured,
      ),
    );
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscured = !isConfirmPasswordObscured;
    emit(
      AuthPasswordVisibilityChanged(
        isPasswordObscured,
        isConfirmPasswordObscured,
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    if (!(formKey.currentState?.validate() ?? false)) return; // ✅ form kontrolü

    emit(AuthLoading());
    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email != AppTexts.reqresEmail) {
        emit(AuthError(AppTexts.emailNotRegistered));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppTexts.emailNotRegistered),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (password != AppTexts.reqresPassword) {
        emit(AuthError(AppTexts.wrongPassword));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppTexts.wrongPassword),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      final model = AuthRegisterModel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      final response = await _authService.signUp(model);
      emit(AuthSuccess('${AppTexts.signUpSuccess} ${response.token}'));
      // Clear the controllers after successful sign up
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      // delay to show the success message
      await Future.delayed(AppDuration.medium);
      // Use NavigationHelper to navigate to HomePage
      await Navigation.pushReplace(page: HomePage());
    } catch (e) {
      emit(AuthError('${AppTexts.anErrorOccurred} $e'.toString()));
    }
  }
}
