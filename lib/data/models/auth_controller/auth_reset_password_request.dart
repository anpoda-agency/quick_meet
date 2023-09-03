import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'auth_reset_password_request.g.dart';

@JsonSerializable()
class AuthResetPasswordRequest {
  @JsonKey(name: 'phoneNumber', fromJson: FromJsonBase.jsonToString)
  final String phoneNumber;
  @JsonKey(name: 'password', fromJson: FromJsonBase.jsonToString)
  final String password;

  const AuthResetPasswordRequest({
    this.phoneNumber = '',
    this.password = '',
  });

  factory AuthResetPasswordRequest.fromJson(Map<String, dynamic> json) => _$AuthResetPasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResetPasswordRequestToJson(this);

  AuthResetPasswordRequest copyWith({
    String? phoneNumber,
    String? password,
  }) {
    return AuthResetPasswordRequest(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }
}
