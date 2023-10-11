import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'auth_login_request.g.dart';

@JsonSerializable()
class AuthLoginRequest {
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'password', fromJson: FromJsonBase.jsonToString)
  final String password;

  const AuthLoginRequest({
    this.phoneNumber = '',
    this.password = '',
  });

  factory AuthLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$AuthLoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthLoginRequestToJson(this);

  AuthLoginRequest copyWith({
    String? phoneNumber,
    String? password,
  }) {
    return AuthLoginRequest(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
