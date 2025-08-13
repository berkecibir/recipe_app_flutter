import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';

class FormValidator {
  static String? validateForm(String? data) {
    return (data?.isNotEmpty ?? false) ? null : AppTexts.formValidatorMessage;
  }

  // email validate
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppTexts.emptyEmailMessage;
    }
    final regexp = RegExp(AppTexts.authRegExp);
    return regexp.hasMatch(email) ? null : AppTexts.notDefiendEmailMessage;
  }
  // password validate

  static String? validatePassword(String? password, {int minLength = 6}) {
    if (password == null || password.isEmpty) {
      return AppTexts.emptyPasswordMessage;
    }
    if (password.length < minLength) {
      return AppTexts.minLengthPasswordMessage(minLength);
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? originalPassword,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return AppTexts.emptyConfirmPasswordMessage;
    }
    if (confirmPassword != originalPassword) {
      return AppTexts.notMatchConfirmPasswordMessage;
    }
    return null;
  }
}
