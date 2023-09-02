import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quick_meet/data/models/user_controller/user_get_guest_meet_list_response.dart';
import 'package:quick_meet/data/models/user_controller/user_get_id_response.dart';
import 'package:quick_meet/data/models/user_controller/user_get_owner_meet_list_response.dart';
import 'package:quick_meet/data/models/user_controller/user_remove_avatar_response.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_request.dart';
import 'package:quick_meet/data/models/user_controller/user_update_id_response.dart';
import 'package:quick_meet/data/models/user_controller/user_upload_avatar_response.dart';
import 'package:quick_meet/data/models/user_controller/user_upload_list_request.dart';
import 'package:quick_meet/data/network/api/user_api.dart';
import 'package:quick_meet/data/network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository({required this.userApi});

  Future<UserGetIdResponse> userGetId({required String path}) async {
    try {
      final response = await userApi.userGetId(path: path);
      return UserGetIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUpdateIdResponse> userUpdateId(
      {required UserUpdateIdRequest request}) async {
    try {
      final response = await userApi.userUpdateId(request: request);
      return UserUpdateIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUploadAvatarResponse> userUploadAvatar(
      {required String path, required File data}) async {
    try {
      final response = await userApi.userUploadAvatar(path: path, data: data);
      return UserUploadAvatarResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserRemoveAvatarResponse> userRemoveAvatar(
      {required String path}) async {
    try {
      final response = await userApi.userRemoveAvatar(path: path);
      return UserRemoveAvatarResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserGetGuestMeetListResponse> userGetGuestMeetList(
      {required String path}) async {
    try {
      final response = await userApi.userGetGuestMeetList(path: path);
      return UserGetGuestMeetListResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserGetOwnerMeetListResponse> userGetOwnerMeetList(
      {required String path}) async {
    try {
      final response = await userApi.userGetOwnerMeetList(path: path);
      return UserGetOwnerMeetListResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUploadListRequest> userUploadList(
      {required UserUploadListRequest request}) async {
    try {
      final response = await userApi.userUploadList(request: request);
      return UserUploadListRequest.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
