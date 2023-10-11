// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'user_update_id_request.g.dart';

@JsonSerializable()
class UserUpdateIdRequest {
  @JsonKey(name: 'deleted', fromJson: FromJsonBase.jsonToBool)
  final bool deleted;
  @JsonKey(name: 'description', fromJson: FromJsonBase.jsonToString)
  final String description;
  @JsonKey(name: 'email', fromJson: FromJsonBase.jsonToString)
  final String email;
  @JsonKey(name: 'firstName', fromJson: FromJsonBase.jsonToString)
  final String firstName;
  @JsonKey(name: 'role', fromJson: FromJsonBase.jsonToString)
  final String? role;
  @JsonKey(name: 'secondName', fromJson: FromJsonBase.jsonToString)
  final String secondName;

  const UserUpdateIdRequest({
    this.deleted = false,
    this.description = '',
    this.email = '',
    this.firstName = '',
    this.role,
    this.secondName = '',
  });

  factory UserUpdateIdRequest.fromJson(Map<String, dynamic> json) => _$UserUpdateIdRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserUpdateIdRequestToJson(this);

  UserUpdateIdRequest copyWith({
    bool? deleted,
    String? description,
    String? email,
    String? firstName,
    String? role,
    String? secondName,
  }) {
    return UserUpdateIdRequest(
      deleted: deleted ?? this.deleted,
      description: description ?? this.description,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      role: role ?? this.role,
      secondName: secondName ?? this.secondName,
    );
  }
}
