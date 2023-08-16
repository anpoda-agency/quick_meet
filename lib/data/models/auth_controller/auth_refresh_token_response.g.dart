// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_refresh_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRefreshTokenResponse _$AuthRefreshTokenResponseFromJson(
        Map<String, dynamic> json) =>
    AuthRefreshTokenResponse(
      payload: json['payload'] == null
          ? const Payload()
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthRefreshTokenResponseToJson(
        AuthRefreshTokenResponse instance) =>
    <String, dynamic>{
      'payload': instance.payload,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      accessToken: json['accessToken'] == null
          ? ''
          : FromJsonBase.jsonToString(json['accessToken']),
      refreshToken: json['refreshToken'] == null
          ? ''
          : FromJsonBase.jsonToString(json['refreshToken']),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
