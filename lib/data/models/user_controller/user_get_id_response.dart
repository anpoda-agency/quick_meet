// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'user_get_id_response.g.dart';

@JsonSerializable()
class UserGetIdResponse {
  @JsonKey(name: 'accountClass', fromJson: FromJsonBase.jsonToString)
  final String accountClass;
  @JsonKey(name: 'accountRank', fromJson: FromJsonBase.jsonToInt)
  final int accountRank;
  @JsonKey(name: 'active', fromJson: FromJsonBase.jsonToBool)
  final bool active;
  @JsonKey(name: 'attendSeries', fromJson: FromJsonBase.jsonToInt)
  final int attendSeries;
  @JsonKey(name: 'avatar')
  final Avatar avatar;
  @JsonKey(name: 'billingAccount')
  final BillingAccount billingAccount;
  @JsonKey(name: 'birthDate', fromJson: FromJsonBase.jsonToString)
  final String birthDate;
  @JsonKey(name: 'blocked', fromJson: FromJsonBase.jsonToBool)
  final bool blocked;
  @JsonKey(name: 'city')
  final City city;
  @JsonKey(name: 'description', fromJson: FromJsonBase.jsonToString)
  final String description;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'emailConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool emailConfirmed;
  @JsonKey(name: 'firstName', fromJson: FromJsonBase.jsonToString)
  final String firstName;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'lastName', fromJson: FromJsonBase.jsonToString)
  final String lastName;
  @JsonKey(name: 'missSeries', fromJson: FromJsonBase.jsonToInt)
  final int missSeries;
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'removed', fromJson: FromJsonBase.jsonToBool)
  final bool removed;
  @JsonKey(name: 'secondName', fromJson: FromJsonBase.jsonToString)
  final String secondName;

  const UserGetIdResponse({
    this.accountClass = '',
    this.accountRank = 0,
    this.active = false,
    this.attendSeries = 0,
    this.avatar = const Avatar(),
    this.billingAccount = const BillingAccount(),
    this.birthDate = '',
    this.blocked = false,
    this.city = const City(),
    this.description = '',
    this.email = '',
    this.emailConfirmed = false,
    this.firstName = '',
    this.id = '',
    this.lastName = '',
    this.missSeries = 0,
    this.phoneNumber = '',
    this.registrationDate = '',
    this.removed = false,
    this.secondName = '',
  });

  factory UserGetIdResponse.fromJson(Map<String, dynamic> json) =>
      _$UserGetIdResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserGetIdResponseToJson(this);

  UserGetIdResponse copyWith({
    String? accountClass,
    int? accountRank,
    bool? active,
    int? attendSeries,
    Avatar? avatar,
    BillingAccount? billingAccount,
    String? birthDate,
    bool? blocked,
    City? city,
    String? description,
    String? email,
    bool? emailConfirmed,
    String? firstName,
    String? id,
    String? lastName,
    int? missSeries,
    String? phoneNumber,
    String? registrationDate,
    bool? removed,
    String? secondName,
  }) {
    return UserGetIdResponse(
      accountClass: accountClass ?? this.accountClass,
      accountRank: accountRank ?? this.accountRank,
      active: active ?? this.active,
      attendSeries: attendSeries ?? this.attendSeries,
      avatar: avatar ?? this.avatar,
      billingAccount: billingAccount ?? this.billingAccount,
      birthDate: birthDate ?? this.birthDate,
      blocked: blocked ?? this.blocked,
      city: city ?? this.city,
      description: description ?? this.description,
      email: email ?? this.email,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      lastName: lastName ?? this.lastName,
      missSeries: missSeries ?? this.missSeries,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      registrationDate: registrationDate ?? this.registrationDate,
      removed: removed ?? this.removed,
      secondName: secondName ?? this.secondName,
    );
  }
}

@JsonSerializable()
class Avatar {
  @JsonKey(name: 'fileName', fromJson: FromJsonBase.jsonToString)
  final String fileName;
  @JsonKey(name: 'href', fromJson: FromJsonBase.jsonToString)
  final String href;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;

  const Avatar({
    this.fileName = '',
    this.href = '',
    this.id = '',
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
  Map<String, dynamic> toJson() => _$AvatarToJson(this);

  Avatar copyWith({
    String? fileName,
    String? href,
    String? id,
  }) {
    return Avatar(
      fileName: fileName ?? this.fileName,
      href: href ?? this.href,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class BillingAccount {
  @JsonKey(name: 'cardNumber', fromJson: FromJsonBase.jsonToString)
  final String cardNumber;
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'nextBillDate', fromJson: FromJsonBase.jsonToString)
  final String nextBillDate;

  const BillingAccount({
    this.cardNumber = '',
    this.id = '',
    this.nextBillDate = '',
  });

  factory BillingAccount.fromJson(Map<String, dynamic> json) => _$BillingAccountFromJson(json);
  Map<String, dynamic> toJson() => _$BillingAccountToJson(this);

  BillingAccount copyWith({
    String? cardNumber,
    String? id,
    String? nextBillDate,
  }) {
    return BillingAccount(
      cardNumber: cardNumber ?? this.cardNumber,
      id: id ?? this.id,
      nextBillDate: nextBillDate ?? this.nextBillDate,
    );
  }
}

@JsonSerializable()
class City {
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'name', fromJson: FromJsonBase.jsonToString)
  final String name;

  const City({
    this.id = '',
    this.name = '',
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
  Map<String, dynamic> toJson() => _$CityToJson(this);

  City copyWith({
    String? id,
    String? name,
  }) {
    return City(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
