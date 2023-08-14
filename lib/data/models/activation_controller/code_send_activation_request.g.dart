// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_send_activation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeSendActivationRequest _$CodeSendActivationRequestFromJson(
        Map<String, dynamic> json) =>
    CodeSendActivationRequest(
      code: json['code'] == null ? '' : FromJsonBase.jsonToString(json['code']),
      source: json['source'] == null
          ? ''
          : FromJsonBase.jsonToString(json['source']),
      verificationStep: json['verificationStep'] == null
          ? ''
          : FromJsonBase.jsonToString(json['verificationStep']),
      verificationType: json['verificationType'] == null
          ? ''
          : FromJsonBase.jsonToString(json['verificationType']),
    );

Map<String, dynamic> _$CodeSendActivationRequestToJson(
        CodeSendActivationRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'source': instance.source,
      'verificationStep': instance.verificationStep,
      'verificationType': instance.verificationType,
    };
