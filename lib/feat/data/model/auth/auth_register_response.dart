import 'package:recipe_app_flutter/feat/core/utils/constants/app_texts.dart';

class AuthRegisterResponse {
  int? id;
  String? token;

  AuthRegisterResponse({this.id, this.token});

  AuthRegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json[AppTexts.idKey];
    token = json[AppTexts.token];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[AppTexts.idKey] = id;
    data[AppTexts.token] = token;
    return data;
  }
}
