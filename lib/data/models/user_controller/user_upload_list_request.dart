// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'user_upload_list_request.g.dart';

@JsonSerializable()
class UserUploadListRequest {
  @JsonKey(name: 'userList', fromJson: FromJsonBase.jsonToListString)
  final List<String> userList;

  const UserUploadListRequest({
    this.userList = const <String>[],
  });

  factory UserUploadListRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUploadListRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserUploadListRequestToJson(this);

  UserUploadListRequest copyWith({
    List<String>? userList,
  }) {
    return UserUploadListRequest(
      userList: userList ?? this.userList,
    );
  }
}

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith