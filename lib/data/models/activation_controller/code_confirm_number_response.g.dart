// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_confirm_number_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeConfirmNumberResponse _$CodeConfirmNumberResponseFromJson(
        Map<String, dynamic> json) =>
    CodeConfirmNumberResponse(
      step: json['step'] == null ? '' : FromJsonBase.jsonToString(json['step']),
      message: json['message'] == null
          ? ''
          : FromJsonBase.jsonToString(json['message']),
      success: json['success'] == null
          ? false
          : FromJsonBase.jsonToBool(json['success']),
    );

Map<String, dynamic> _$CodeConfirmNumberResponseToJson(
        CodeConfirmNumberResponse instance) =>
    <String, dynamic>{
      'step': instance.step,
      'message': instance.message,
      'success': instance.success,
    };
