// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginRequest _$AuthLoginRequestFromJson(Map<String, dynamic> json) =>
    AuthLoginRequest(
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      password: json['password'] == null
          ? ''
          : FromJsonBase.jsonToString(json['password']),
    );

Map<String, dynamic> _$AuthLoginRequestToJson(AuthLoginRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
