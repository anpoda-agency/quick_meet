// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResetPasswordRequest _$AuthResetPasswordRequestFromJson(
        Map<String, dynamic> json) =>
    AuthResetPasswordRequest(
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      password: json['password'] == null
          ? ''
          : FromJsonBase.jsonToString(json['password']),
    );

Map<String, dynamic> _$AuthResetPasswordRequestToJson(
        AuthResetPasswordRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
