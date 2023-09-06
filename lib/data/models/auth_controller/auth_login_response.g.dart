// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthLoginResponse _$AuthLoginResponseFromJson(Map<String, dynamic> json) =>
    AuthLoginResponse(
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      payload: json['payload'] == null
          ? const Payload()
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthLoginResponseToJson(AuthLoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'payload': instance.payload,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      avatar: json['avatar'] == null
          ? const Avatar()
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      firstName: json['firstName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['firstName']),
      secondName: json['secondName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['secondName']),
      lastName: json['lastName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['lastName']),
      accountRank: json['accountRank'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['accountRank']),
      missSeries: json['missSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['missSeries']),
      attendSeries: json['attendSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['attendSeries']),
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      birthDate: json['birthDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['birthDate']),
      active: json['active'] == null
          ? false
          : FromJsonBase.jsonToBool(json['active']),
      emailConfirmed: json['emailConfirmed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['emailConfirmed']),
      removed: json['removed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['removed']),
      blocked: json['blocked'] == null
          ? false
          : FromJsonBase.jsonToBool(json['blocked']),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'lastName': instance.lastName,
      'accountRank': instance.accountRank,
      'avatar': instance.avatar,
      'missSeries': instance.missSeries,
      'attendSeries': instance.attendSeries,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'email': instance.email,
      'registrationDate': instance.registrationDate,
      'birthDate': instance.birthDate,
      'active': instance.active,
      'emailConfirmed': instance.emailConfirmed,
      'removed': instance.removed,
      'blocked': instance.blocked,
    };

Avatar _$AvatarFromJson(Map<String, dynamic> json) => Avatar(
      fileName: json['fileName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['fileName']),
      href: json['href'] == null ? '' : FromJsonBase.jsonToString(json['href']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
    );

Map<String, dynamic> _$AvatarToJson(Avatar instance) => <String, dynamic>{
      'fileName': instance.fileName,
      'href': instance.href,
      'id': instance.id,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      accessToken: json['access_token'] == null
          ? ''
          : FromJsonBase.jsonToString(json['access_token']),
      refreshToken: json['refresh_token'] == null
          ? ''
          : FromJsonBase.jsonToString(json['refresh_token']),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
