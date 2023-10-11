import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_refresh_token_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_request.dart';
import 'package:quick_meet/data/network/api/auth_api.dart';
import 'package:quick_meet/data/network/dio_exception.dart';

class AuthRepository extends ChangeNotifier {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  bool _isAuth = false;
  bool get isAuth => _isAuth;

  void changeAuthStatus({bool? val}) {
    if (val != null) {
      _isAuth = val;
    } else {
      _isAuth = !_isAuth;
    }
    notifyListeners();
  }

  Future<AuthLoginResponse> verificationLogin({required String phone}) async {
    try {
      final response = await authApi.verificationLogin(phone: phone);
      return AuthLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthLoginResponse> login({required AuthLoginRequest request}) async {
    try {
      final response = await authApi.login(request: request);
      return AuthLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthRefreshTokenResponse> refreshToken({required String path}) async {
    try {
      final response = await authApi.refreshToken(path: path);
      return AuthRefreshTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthLoginResponse> register({required AuthRegisterRequest request}) async {
    try {
      final response = await authApi.register(request: request);
      return AuthLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthLoginResponse> resetPassword({required AuthResetPasswordRequest request}) async {
    try {
      final response = await authApi.resetPassword(request: request);
      return AuthLoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
