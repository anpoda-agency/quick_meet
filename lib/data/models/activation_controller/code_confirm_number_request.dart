// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'code_confirm_number_request.g.dart';

@JsonSerializable()
class CodeConfirmNumberRequest {
  @JsonKey(name: 'code', fromJson: FromJsonBase.jsonToString)
  final String code;
  @JsonKey(name: 'source', fromJson: FromJsonBase.jsonToString)
  final String source;
  @JsonKey(name: 'verificationStep', fromJson: FromJsonBase.jsonToString)
  final String verificationStep;
  @JsonKey(name: 'verificationType', fromJson: FromJsonBase.jsonToString)
  final String verificationType;

  const CodeConfirmNumberRequest({
    this.code = '',
    this.source = '',
    this.verificationStep = '',
    this.verificationType = '',
  });

  factory CodeConfirmNumberRequest.fromJson(Map<String, dynamic> json) =>
      _$CodeConfirmNumberRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CodeConfirmNumberRequestToJson(this);

  CodeConfirmNumberRequest copyWith({
    String? code,
    String? source,
    String? verificationStep,
    String? verificationType,
  }) {
    return CodeConfirmNumberRequest(
      code: code ?? this.code,
      source: source ?? this.source,
      verificationStep: verificationStep ?? this.verificationStep,
      verificationType: verificationType ?? this.verificationType,
    );
  }
}

// StoreAddFavouriteRequest

//jsns for factory...
//lamp on hovered class and click on copyWith