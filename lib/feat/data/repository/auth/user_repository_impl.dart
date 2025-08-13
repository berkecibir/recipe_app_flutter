import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_model.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_response.dart';
import 'package:recipe_app_flutter/feat/data/repository/auth/i_user_repository.dart';
import 'package:recipe_app_flutter/feat/data/service/auth/i_user_service.dart';

class UserRepository implements IUserRepository {
  final IUserService _userService;

  UserRepository(this._userService);

  @override
  Future<AuthRegisterResponse> register(AuthRegisterModel registerModel) async {
    try {
      return await _userService.signUp(registerModel);
    } catch (e) {
      debugPrint("Register Error: $e");
      throw Exception("Failed to register user: $e");
    }
  }
}
