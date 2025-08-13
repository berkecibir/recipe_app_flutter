import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';

class AuthRegisterModel {
  String? email;
  String? password;

  AuthRegisterModel({this.email, this.password});

  AuthRegisterModel.fromJson(Map<String, dynamic> json) {
    email = json[AppTexts.emailKey];
    password = json[AppTexts.passwordKey];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppTexts.emailKey] = email;
    data[AppTexts.passwordKey] = password;
    return data;
  }
}
