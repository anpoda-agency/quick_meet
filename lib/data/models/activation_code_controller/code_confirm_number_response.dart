import 'package:json_annotation/json_annotation.dart';

import 'package:quick_meet/data/models/from_json.dart';

part 'code_confirm_number_response.g.dart';

@JsonSerializable()
class CodeConfirmNumberResponse {
  @JsonKey(name: 'step', fromJson: FromJsonBase.jsonToString)
  final String step;
  @JsonKey(name: 'message', fromJson: FromJsonBase.jsonToString)
  final String message;
  @JsonKey(name: 'success', fromJson: FromJsonBase.jsonToBool)
  final bool success;

  const CodeConfirmNumberResponse({
    this.step = '',
    this.message = '',
    this.success = false,
  });

  factory CodeConfirmNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$CodeConfirmNumberResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CodeConfirmNumberResponseToJson(this);

  CodeConfirmNumberResponse copyWith({
    String? step,
    String? message,
    bool? success,
  }) {
    return CodeConfirmNumberResponse(
      step: step ?? this.step,
      message: message ?? this.message,
      success: success ?? this.success,
    );
  }
}
