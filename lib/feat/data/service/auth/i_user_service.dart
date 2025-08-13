import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_model.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_response.dart';

abstract class IUserService {
  Future<AuthRegisterResponse> signUp(AuthRegisterModel registerModel);
}
