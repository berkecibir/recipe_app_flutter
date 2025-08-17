import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_model.dart';
import 'package:recipe_app_flutter/feat/data/model/auth/auth_register_response.dart';
import 'package:recipe_app_flutter/feat/data/service/auth/i_user_service.dart';

class UserService implements IUserService {
  final Dio _dio = Dio();
  final String _url = 'https://reqres.in/api/register';

  @override
  Future<AuthRegisterResponse> signUp(AuthRegisterModel registerModel) async {
    try {
      final response = await _dio.post(
        _url,
        data: registerModel.toJson(),
        options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
      );
      if (response.statusCode == 200) {
        return AuthRegisterResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to register: ${response.statusCode}');
      }
    } on DioException catch (e) {
      debugPrint('Dio error occurred: $e');
      if (e.response != null) {
        debugPrint('Error data: ${e.response?.data}');
      }
      throw Exception('DioException occurred during registration.');
    } catch (e) {
      // Catch any other unexpected errors
      debugPrint('Occurred unexpected error: $e');
      throw Exception('An unexpected error occurred during registration.');
    }
  }
}
