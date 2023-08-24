// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_remove_avatar_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRemoveAvatarResponse _$UserRemoveAvatarResponseFromJson(
        Map<String, dynamic> json) =>
    UserRemoveAvatarResponse(
      accountClass: json['accountClass'] == null
          ? ''
          : FromJsonBase.jsonToString(json['accountClass']),
      accountRank: json['accountRank'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['accountRank']),
      active: json['active'] == null
          ? false
          : FromJsonBase.jsonToBool(json['active']),
      attendSeries: json['attendSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['attendSeries']),
      avatar: json['avatar'] == null
          ? const Avatar()
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      billingAccount: json['billingAccount'] == null
          ? const BillingAccount()
          : BillingAccount.fromJson(
              json['billingAccount'] as Map<String, dynamic>),
      birthDate: json['birthDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['birthDate']),
      blocked: json['blocked'] == null
          ? false
          : FromJsonBase.jsonToBool(json['blocked']),
      city: json['city'] == null
          ? const City()
          : City.fromJson(json['city'] as Map<String, dynamic>),
      description: json['description'] == null
          ? ''
          : FromJsonBase.jsonToString(json['description']),
      email:
          json['email'] == null ? '' : FromJsonBase.jsonToString(json['email']),
      emailConfirmed: json['emailConfirmed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['emailConfirmed']),
      firstName: json['firstName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['firstName']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      lastName: json['lastName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['lastName']),
      missSeries: json['missSeries'] == null
          ? 0
          : FromJsonBase.jsonToInt(json['missSeries']),
      phoneNumber: json['phoneNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['phoneNumber']),
      registrationDate: json['registrationDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['registrationDate']),
      removed: json['removed'] == null
          ? false
          : FromJsonBase.jsonToBool(json['removed']),
      secondName: json['secondName'] == null
          ? ''
          : FromJsonBase.jsonToString(json['secondName']),
    );

Map<String, dynamic> _$UserRemoveAvatarResponseToJson(
        UserRemoveAvatarResponse instance) =>
    <String, dynamic>{
      'accountClass': instance.accountClass,
      'accountRank': instance.accountRank,
      'active': instance.active,
      'attendSeries': instance.attendSeries,
      'avatar': instance.avatar,
      'billingAccount': instance.billingAccount,
      'birthDate': instance.birthDate,
      'blocked': instance.blocked,
      'city': instance.city,
      'description': instance.description,
      'email': instance.email,
      'emailConfirmed': instance.emailConfirmed,
      'firstName': instance.firstName,
      'id': instance.id,
      'lastName': instance.lastName,
      'missSeries': instance.missSeries,
      'phoneNumber': instance.phoneNumber,
      'registrationDate': instance.registrationDate,
      'removed': instance.removed,
      'secondName': instance.secondName,
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

BillingAccount _$BillingAccountFromJson(Map<String, dynamic> json) =>
    BillingAccount(
      cardNumber: json['cardNumber'] == null
          ? ''
          : FromJsonBase.jsonToString(json['cardNumber']),
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      nextBillDate: json['nextBillDate'] == null
          ? ''
          : FromJsonBase.jsonToString(json['nextBillDate']),
    );

Map<String, dynamic> _$BillingAccountToJson(BillingAccount instance) =>
    <String, dynamic>{
      'cardNumber': instance.cardNumber,
      'id': instance.id,
      'nextBillDate': instance.nextBillDate,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      id: json['id'] == null ? '' : FromJsonBase.jsonToString(json['id']),
      name: json['name'] == null ? '' : FromJsonBase.jsonToString(json['name']),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
