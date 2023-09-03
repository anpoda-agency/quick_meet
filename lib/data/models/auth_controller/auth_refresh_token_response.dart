// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'auth_refresh_token_response.g.dart';

@JsonSerializable()
class AuthRefreshTokenResponse {
  @JsonKey(name: 'payload')
  final Payload payload;

  const AuthRefreshTokenResponse({
    this.payload = const Payload(),
  });

  factory AuthRefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$AuthRefreshTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthRefreshTokenResponseToJson(this);

  AuthRefreshTokenResponse copyWith({
    Payload? payload,
  }) {
    return AuthRefreshTokenResponse(
      payload: payload ?? this.payload,
    );
  }
}

@JsonSerializable()
class Payload {
  @JsonKey(name: 'access_token', fromJson: FromJsonBase.jsonToString)
  final String accessToken;
  @JsonKey(name: 'refresh_token', fromJson: FromJsonBase.jsonToString)
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

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith