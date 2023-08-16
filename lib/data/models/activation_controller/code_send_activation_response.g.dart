// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_send_activation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeSendActivationResponse _$CodeSendActivationResponseFromJson(
        Map<String, dynamic> json) =>
    CodeSendActivationResponse(
      step: json['step'] == null ? '' : FromJsonBase.jsonToString(json['step']),
      message: json['message'] == null
          ? ''
          : FromJsonBase.jsonToString(json['message']),
      success: json['success'] == null
          ? false
          : FromJsonBase.jsonToBool(json['success']),
    );

Map<String, dynamic> _$CodeSendActivationResponseToJson(
        CodeSendActivationResponse instance) =>
    <String, dynamic>{
      'step': instance.step,
      'message': instance.message,
      'success': instance.success,
    };
