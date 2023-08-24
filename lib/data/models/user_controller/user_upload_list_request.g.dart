// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_upload_list_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUploadListRequest _$UserUploadListRequestFromJson(
        Map<String, dynamic> json) =>
    UserUploadListRequest(
      userList: json['userList'] == null
          ? const <String>[]
          : FromJsonBase.jsonToListString(json['userList']),
    );

Map<String, dynamic> _$UserUploadListRequestToJson(
        UserUploadListRequest instance) =>
    <String, dynamic>{
      'userList': instance.userList,
    };
