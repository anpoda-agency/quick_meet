import 'package:dio/dio.dart';
import 'package:quick_meet/core/contant.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_request.dart';
import 'package:quick_meet/data/network/dio_client.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<Response> verificationLogin({required String phone}) async {
    String value = phone;
    if (value.contains('+')) {
      value.replaceAll('+', '%2B');
    } else {
      value = '%2B$phone';
    }
    try {
      final Response response = await dioClient.post(
          AppConstants.verificationLoginUrl,
          queryParameters: {'phone': value}
          // body: {},
          );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> login({required AuthLoginRequest request}) async {
    try {
      final Response response = await dioClient.post(
        AppConstants.loginUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> refreshToken({required String path}) async {
    // request body empty
    try {
      final Response response = await dioClient.post(
        AppConstants.refreshTokenUrl + path,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register({required AuthRegisterRequest request}) async {
    try {
      final Response response = await dioClient.post(
        AppConstants.regsiterUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resetPassword(
      {required AuthResetPasswordRequest request}) async {
    try {
      final Response response = await dioClient.post(
        AppConstants.resetPasswordUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
