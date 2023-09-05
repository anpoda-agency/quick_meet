import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_meet/data/models/auth_controller/auth_login_response.dart';
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
import 'package:quick_meet/data/storage/pref_storage.dart';

class UserRepository extends ChangeNotifier {
  final UserApi userApi;

  UserRepository({required this.userApi});

  AuthLoginResponse? _user;
  AuthLoginResponse? get user => _user;

  bool _isBusiness = false;
  bool get isBusiness => _isBusiness;

  Future<void> setUserData({required AuthLoginResponse user, String? token}) async {
    _user = user;
    if (token != null) {
      await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, token);
      await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, user.user.id);
    }
    notifyListeners();
  }

  Future<void> clearUserData() async {
    _user = null;
    await PrefStorageInstance.prefStorage.setRecord(PrefName.userId, '');
    await PrefStorageInstance.prefStorage.setRecord(PrefName.refreshToken, '');
    notifyListeners();
  }

  Future<UserGetIdResponse> userGetId({required String path, String? accessToken}) async {
    try {
      final response = await userApi.userGetId(path: path, accessToken: accessToken);
      return UserGetIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUpdateIdResponse> userUpdateId(
      {required String path, required UserUpdateIdRequest request, String? accessToken}) async {
    try {
      final response = await userApi.userUpdateId(path: path, request: request, accessToken: accessToken);
      return UserUpdateIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUploadAvatarResponse> userUploadAvatar({required String path, required File data}) async {
    try {
      final response = await userApi.userUploadAvatar(path: path, data: data);
      return UserUploadAvatarResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserRemoveAvatarResponse> userRemoveAvatar({required String path}) async {
    try {
      final response = await userApi.userRemoveAvatar(path: path);
      return UserRemoveAvatarResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserGetGuestMeetListResponse> userGetGuestMeetList({required String path}) async {
    try {
      final response = await userApi.userGetGuestMeetList(path: path);
      return UserGetGuestMeetListResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserGetOwnerMeetListResponse> userGetOwnerMeetList({required String path}) async {
    try {
      final response = await userApi.userGetOwnerMeetList(path: path);
      return UserGetOwnerMeetListResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<UserUploadListRequest> userUploadList({required UserUploadListRequest request}) async {
    try {
      final response = await userApi.userUploadList(request: request);
      return UserUploadListRequest.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
