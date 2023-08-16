// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_send_activation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeSendActivationRequest _$CodeSendActivationRequestFromJson(
        Map<String, dynamic> json) =>
    CodeSendActivationRequest(
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
      'source': instance.source,
      'verificationStep': instance.verificationStep,
      'verificationType': instance.verificationType,
    };
