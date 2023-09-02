import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_request.dart';
import 'package:quick_meet/data/models/user_controller/user_upload_list_request.dart';
import 'package:quick_meet/data/network/dio_client.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Response> userGetId({required String path}) async {
    // request body empty
    try {
      final Response response = await dioClient.get(
        AppConstants.userGetIdUrl + path,
        //body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

// НЕ ЗАБЫТЬ СПРОСИТЬ
// здесь все залупа какая та, спросить у попова куда предавать блять реквест, если там нет боди у патча
  Future<Response> userUpdateId({required UserUpdateIdRequest request}) async {
    try {
      final Response response = await dioClient.patch(
        AppConstants.userUpdateIdUrl,
        body: request.toJson(), // похуй пока так
        //data:
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userUploadAvatar({required String path, required File data}) async {
    // request body empty
    const String endUrl = "/avatar";
    try {
      final Response response =
          await dioClient.post(AppConstants.userUploadAvatarUrl + path + endUrl, queryParameters: {'file': data}
              //body: request.toJson(),
              );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userRemoveAvatar({required String path}) async {
    // request body empty
    const String endUrl = "/avatar";
    try {
      final Response response = await dioClient.delete(
        AppConstants.userRemoveAvatarUrl + path + endUrl,
        //body: request.toJson(),
      );
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
