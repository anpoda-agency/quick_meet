// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'auth_register_response.g.dart';

@JsonSerializable()
class AuthRegisterResponse {
  @JsonKey(name: 'payload')
  final Payload payload;
  @JsonKey(name: 'user')
  final User user;

  const AuthRegisterResponse({
    this.payload = const Payload(),
    this.user = const User(),
  });

  factory AuthRegisterResponse.fromJson(Map<String, dynamic> json) => _$AuthRegisterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRegisterResponseToJson(this);

  AuthRegisterResponse copyWith({
    Payload? payload,
    User? user,
  }) {
    return AuthRegisterResponse(
      payload: payload ?? this.payload,
      user: user ?? this.user,
    );
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'accessToken', fromJson: FromJsonBase.jsonToString)
  final String accessToken;
  @JsonKey(name: 'refreshToken', fromJson: FromJsonBase.jsonToString)
  final String refreshToken;

  const Payload({
    this.accessToken = '',
    this.refreshToken = '',
  });

  factory Payload.fromJson(Map<String, dynamic> json) => _$PayloadFromJson(json);
  Map<String, dynamic> toJson() => _$PayloadToJson(this);

  Payload copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return Payload(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: 'accountClass', fromJson: FromJsonBase.jsonToString)
  final String accountClass;
  @JsonKey(name: 'accountRank', fromJson: FromJsonBase.jsonToInt)
  final int accountRank;
  @JsonKey(name: 'active', fromJson: FromJsonBase.jsonToBool)
  final bool active;
  @JsonKey(name: 'attendSeries', fromJson: FromJsonBase.jsonToInt)
  final int attendSeries;
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

  const User({
    this.accountClass = '',
    this.accountRank = 0,
    this.active = false,
    this.attendSeries = 0,
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? accountClass,
    int? accountRank,
    bool? active,
    int? attendSeries,
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
    return User(
      accountClass: accountClass ?? this.accountClass,
      accountRank: accountRank ?? this.accountRank,
      active: active ?? this.active,
      attendSeries: attendSeries ?? this.attendSeries,
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
