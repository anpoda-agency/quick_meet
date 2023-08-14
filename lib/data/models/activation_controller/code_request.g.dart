// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreAddFavouriteRequest _$StoreAddFavouriteRequestFromJson(
        Map<String, dynamic> json) =>
    StoreAddFavouriteRequest(
      product:
          json['product'] == null ? 0 : FromJsonBase.jsonToInt(json['product']),
    );

Map<String, dynamic> _$StoreAddFavouriteRequestToJson(
        StoreAddFavouriteRequest instance) =>
    <String, dynamic>{
      'product': instance.product,
    };
