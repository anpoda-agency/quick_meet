// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_update_id_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserUpdateIdRequest _$UserUpdateIdRequestFromJson(Map<String, dynamic> json) =>
    UserUpdateIdRequest(
      deleted: json['deleted'] == null
          ? false
          : FromJsonBase.jsonToBool(json['deleted']),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      firstName: json['firstName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['firstName']),
      role: json['role'] == null ? '' : FromJsonBase.jsonToString(json['role']),
      secondName: json['secondName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['secondName']),
    );

Map<String, dynamic> _$UserUpdateIdRequestToJson(
        UserUpdateIdRequest instance) =>
    <String, dynamic>{
      'deleted': instance.deleted,
      'description': instance.description,
      'email': instance.email,
      'firstName': instance.firstName,
      'role': instance.role,
      'secondName': instance.secondName,
    };
