import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_request.dart';
import 'package:quick_meet/data/models/user_controller/user_upload_list_request.dart';
import 'package:quick_meet/data/network/dio_client.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> userGetId({required String path, String? accessToken}) async {
    // request body empty
    try {
      final Response response =
          await dioClient.get(AppConstants.userGetIdUrl + path, accessToken: accessToken
              //body: request.toJson(),
              );
      return response;
    } catch (e) {
      rethrow;
    }
  }


  Future<Response> userUpdateId(
      {required String path, required UserUpdateIdRequest request, String? accessToken}) async {
    var body = request.toJson();
    body.removeWhere((key, value) => value == null);
    try {
      final Response response = await dioClient.patch(
        AppConstants.userUpdateIdUrl + path,
        accessToken: accessToken,
        data: body, 
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userUploadAvatar(
      {required String accessToken, required String path, required File file}) async {
    const String endUrl = "/avatar";
    try {
      final Response response = await dioClient.postFile(
          AppConstants.userUploadAvatarUrl + path + endUrl,
          file: file,
          accessToken: accessToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userRemoveAvatar({required String accessToken, required String path}) async {
    const String endUrl = "/avatar";
    try {
      final Response response = await dioClient
          .delete(AppConstants.userRemoveAvatarUrl + path + endUrl, accessToken: accessToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userGetGuestMeetList({required String path}) async {
    // request body empty
    const String endUrl = "/meet-list/guest";
    try {
      final Response response = await dioClient.get(
        AppConstants.userGetGuestMeetListUrl + path + endUrl,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userGetOwnerMeetList({required String path}) async {
    // request body empty
    const String endUrl = "/meet-list/owner";
    try {
      final Response response = await dioClient.get(
        AppConstants.userGetGuestMeetListUrl + path + endUrl,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userUploadList({required UserUploadListRequest request}) async {
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
}
