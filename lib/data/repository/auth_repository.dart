import 'package:dio/dio.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_refresh_token_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_response.dart';
import 'package:quick_meet/data/models/auth_controller/auth_verification_login_response.dart';
import 'package:quick_meet/data/network/api/auth_api.dart';
import 'package:quick_meet/data/network/dio_exception.dart';

class AuthRepository {
  final AuthApi authApi;

  AuthRepository({required this.authApi});

  Future<AuthVerificationLoginResponse> verificationLogin({required String phone}) async {
    try {
      final response = await authApi.verificationLogin(phone: phone);
      return AuthVerificationLoginResponse.fromJson(response.data);
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

  Future<AuthRegisterResponse> register({required AuthRegisterRequest request}) async {
    try {
      final response = await authApi.register(request: request);
      return AuthRegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<AuthResetPasswordResponse> resetPassword({required AuthResetPasswordRequest request}) async {
    try {
      final response = await authApi.resetPassword(request: request);
      return AuthResetPasswordResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
