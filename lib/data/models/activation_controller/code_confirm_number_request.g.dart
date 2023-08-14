// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_confirm_number_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeConfirmNumberRequest _$CodeConfirmNumberRequestFromJson(
        Map<String, dynamic> json) =>
    CodeConfirmNumberRequest(
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

Map<String, dynamic> _$CodeConfirmNumberRequestToJson(
        CodeConfirmNumberRequest instance) =>
    <String, dynamic>{
      'code': instance.code,
      'source': instance.source,
      'verificationStep': instance.verificationStep,
      'verificationType': instance.verificationType,
    };
