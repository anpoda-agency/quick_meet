import 'package:dio/dio.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_register_request.dart';
import 'package:quick_meet/data/models/auth_controller/auth_reset_password_request.dart';
import 'package:quick_meet/data/network/dio_client.dart';

class AuthApi {
  final DioClient dioClient;

  AuthApi({required this.dioClient});

  Future<Response> verificationLogin({required String phone}) async {
    try {
      final Response response =
          await dioClient.post(AppConstants.verificationLoginUrl, queryParameters: {'phone': phone});
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
    try {
      final Response response = await dioClient.post(
        AppConstants.refreshTokenUrl + path,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> register({required AuthRegisterRequest request}) async {
    var body = request.toJson();
    body.removeWhere((key, value) => value == null);
    try {
      final Response response = await dioClient.post(
        AppConstants.regsiterUrl,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> resetPassword({required AuthResetPasswordRequest request}) async {
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
