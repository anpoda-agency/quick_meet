import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'code_send_activation_response.g.dart';

@JsonSerializable()
class CodeSendActivationResponse {
  @JsonKey(name: 'step', fromJson: FromJsonBase.jsonToString)
  final String step;
  @JsonKey(name: 'message', fromJson: FromJsonBase.jsonToString)
  final String message;
  @JsonKey(name: 'success', fromJson: FromJsonBase.jsonToBool)
  final bool success;

  const CodeSendActivationResponse({
    this.step = '',
    this.message = '',
    this.success = false,
  });

  factory CodeSendActivationResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeSendActivationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CodeSendActivationResponseToJson(this);

  CodeSendActivationResponse copyWith({
    String? step,
    String? message,
    bool? success,
  }) {
    return CodeSendActivationResponse(
      step: step ?? this.step,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }
}
