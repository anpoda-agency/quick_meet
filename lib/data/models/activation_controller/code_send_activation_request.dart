import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'code_send_activation_request.g.dart';

@JsonSerializable()
class CodeSendActivationRequest {
  @JsonKey(name: 'code', fromJson: FromJsonBase.jsonToString)
  final String code;
  @JsonKey(name: 'source', fromJson: FromJsonBase.jsonToString)
  final String source;
  @JsonKey(name: 'verificationStep', fromJson: FromJsonBase.jsonToString)
  final String verificationStep;
  @JsonKey(name: 'verificationType', fromJson: FromJsonBase.jsonToString)
  final String verificationType;

  const CodeSendActivationRequest({
    this.code = '',
    this.source = '',
    this.verificationStep = '',
    this.verificationType = '',
  });

  factory CodeSendActivationRequest.fromJson(Map<String, dynamic> json) =>
      _$CodeSendActivationRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CodeSendActivationRequestToJson(this);

  CodeSendActivationRequest copyWith({
    String? code,
    String? source,
    String? verificationStep,
    String? verificationType,
  }) {
    return CodeSendActivationRequest(
      code: code ?? this.code,
      source: source ?? this.source,
      verificationStep: verificationStep ?? this.verificationStep,
      verificationType: verificationType ?? this.verificationType,
    );
  }
}
