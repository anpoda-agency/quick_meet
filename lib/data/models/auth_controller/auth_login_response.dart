import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'auth_login_response.g.dart';

@JsonSerializable()
class AuthLoginResponse {
  @JsonKey(name: 'user')
  final User user;
  @JsonKey(name: 'payload') // from json снести
  final Payload payload;

  const AuthLoginResponse({
    this.user = const User(), // вот так надо
    this.payload = const Payload(),
  });

  factory AuthLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthLoginResponseToJson(this);

  AuthLoginResponse copyWith({
    User? user,
    Payload? payload,
  }) {
    return AuthLoginResponse(
      user: user ?? this.user,
      payload: payload ?? this.payload,
    );
  }
}

@JsonSerializable()
class User {
  @JsonKey(name: 'id', fromJson: FromJsonBase.jsonToString)
  final String id;
  @JsonKey(name: 'firstName', fromJson: FromJsonBase.jsonToString)
  final String firstName;
  @JsonKey(name: 'secondName', fromJson: FromJsonBase.jsonToString)
  final String secondName;
  @JsonKey(
      name: 'lastName',
      fromJson: FromJsonBase.jsonToString) // Спросить про null переменую
  final String lastName;
  @JsonKey(name: 'accountClass', fromJson: FromJsonBase.jsonToString)
  final String accountClass;
  @JsonKey(name: 'accountRank', fromJson: FromJsonBase.jsonToInt)
  final int accountRank;
  @JsonKey(name: 'missSeries', fromJson: FromJsonBase.jsonToInt)
  final int missSeries;
  @JsonKey(name: 'attendSeries', fromJson: FromJsonBase.jsonToInt)
  final int attendSeries;
  @JsonKey(name: 'city')
  final City city;
  //@JsonKey(name: 'city', fromJson: FromJsonBase.jsonToListString) // Спросить почему здесь лист должен быть а не мапа
  //final List<City> city;
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'description', fromJson: FromJsonBase.jsonToString)
  final String description;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'billingAccount', fromJson: FromJsonBase.jsonToString)
  final String? billingAccount;
  @JsonKey(name: 'registrationDate', fromJson: FromJsonBase.jsonToString)
  final String registrationDate;
  @JsonKey(name: 'birthDate', fromJson: FromJsonBase.jsonToString)
  final String birthDate;
  @JsonKey(name: 'active', fromJson: FromJsonBase.jsonToBool)
  final bool active;
  @JsonKey(name: 'emailConfirmed', fromJson: FromJsonBase.jsonToBool)
  final bool emailConfirmed;
  @JsonKey(name: 'removed', fromJson: FromJsonBase.jsonToBool)
  final bool removed;
  @JsonKey(name: 'blocked', fromJson: FromJsonBase.jsonToBool)
  final bool blocked;

  const User({
    this.id = '',
    this.firstName = '',
    this.secondName = '',
    this.lastName = '',
    this.accountClass = '',
    this.accountRank = 0,
    this.missSeries = 0,
    this.attendSeries = 0,
    this.city = const City(),
    //this.city = const [],
    this.phoneNumber = '',
    this.description = '',
    this.email = '',
    this.billingAccount,
    this.registrationDate = '',
    this.birthDate = '',
    this.active = false,
    this.emailConfirmed = false,
    this.removed = false,
    this.blocked = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    String? id,
    String? firstName,
    String? secondName,
    String? lastName,
    String? accountClass,
    int? accountRank,
    int? missSeries,
    int? attendSeries,
    City? city,
    String? phoneNumber,
    String? description,
    String? email,
    String? billingAccount,
    String? registrationDate,
    String? birthDate,
    bool? active,
    bool? emailConfirmed,
    bool? removed,
    bool? blocked,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      lastName: lastName ?? this.lastName,
      accountClass: accountClass ?? this.accountClass,
      accountRank: accountRank ?? this.accountRank,
      missSeries: missSeries ?? this.missSeries,
      attendSeries: attendSeries ?? this.attendSeries,
      city: city ?? this.city,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      description: description ?? this.description,
      email: email ?? this.email,
      billingAccount: billingAccount ?? this.billingAccount,
      registrationDate: registrationDate ?? this.registrationDate,
      birthDate: birthDate ?? this.birthDate,
      active: active ?? this.active,
      emailConfirmed: emailConfirmed ?? this.emailConfirmed,
      removed: removed ?? this.removed,
      blocked: blocked ?? this.blocked,
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

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
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

// поубирать знаки вопросы, все к стрингу делать без налов
// выписать поля где null

/*
нулы в user:

  lastName
  description
  billingAccount

*/
