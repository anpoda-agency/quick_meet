// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_verification_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthVerificationLoginResponse _$AuthVerificationLoginResponseFromJson(
        Map<String, dynamic> json) =>
    AuthVerificationLoginResponse(
      user: json['user'] == null
          ? const User()
          : User.fromJson(json['user'] as Map<String, dynamic>),
      payload: json['payload'] == null
          ? const Payload()
          : Payload.fromJson(json['payload'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthVerificationLoginResponseToJson(
        AuthVerificationLoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'payload': instance.payload,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
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
      accountClass: json['accountClass'] == null
          ? ''
          : FromJsonBase.jsonToString(json['accountClass']),
      accountRank: json['accountRank'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['accountRank']),
      missSeries: json['missSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['missSeries']),
      attendSeries: json['attendSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['attendSeries']),
      city: json['city'] == null
          ? const City()
          : City.fromJson(json['city'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      billingAccount: FromJsonBase.jsonToString(json['billingAccount']),
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
      'accountClass': instance.accountClass,
      'accountRank': instance.accountRank,
      'missSeries': instance.missSeries,
      'attendSeries': instance.attendSeries,
      'city': instance.city,
      'phoneNumber': instance.phoneNumber,
      'description': instance.description,
      'email': instance.email,
      'billingAccount': instance.billingAccount,
      'registrationDate': instance.registrationDate,
      'birthDate': instance.birthDate,
      'active': instance.active,
      'emailConfirmed': instance.emailConfirmed,
      'removed': instance.removed,
      'blocked': instance.blocked,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      name: json['name'] == null ? '' : FromJsonBase.jsonToString(json['name']),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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
