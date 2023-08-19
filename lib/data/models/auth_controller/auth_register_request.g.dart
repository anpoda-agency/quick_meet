// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_register_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRegisterRequest _$AuthRegisterRequestFromJson(Map<String, dynamic> json) =>
    AuthRegisterRequest(
      birthDate: json['birthDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['birthDate']),
      cityId: json['cityId'] == null
          ? ''
          : FromJsonBase.jsonToString(json['cityId']),
      cityName: json['cityName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['cityName']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      firstName: json['firstName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['firstName']),
      lastName: FromJsonBase.jsonToString(json['lastName']),
      password: json['password'] == null
          ? ''
          : FromJsonBase.jsonToString(json['password']),
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      secondName: json['secondName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['secondName']),
    );

Map<String, dynamic> _$AuthRegisterRequestToJson(
        AuthRegisterRequest instance) =>
    <String, dynamic>{
      'birthDate': instance.birthDate,
      'cityId': instance.cityId,
      'cityName': instance.cityName,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'secondName': instance.secondName,
    };
