import 'package:json_annotation/json_annotation.dart';
import 'package:quick_meet/data/models/from_json.dart';

part 'code_request.g.dart';

@JsonSerializable()
class StoreAddFavouriteRequest {
  @JsonKey(name: 'product', fromJson: FromJsonBase.jsonToInt)
  final int product;

  const StoreAddFavouriteRequest({
    this.product = 0,
  });

  factory StoreAddFavouriteRequest.fromJson(Map<String, dynamic> json) => _$StoreAddFavouriteRequestFromJson(json);
  Map<String, dynamic> toJson() => _$StoreAddFavouriteRequestToJson(this);

  StoreAddFavouriteRequest copyWith({
    int? product,
  }) {
    return StoreAddFavouriteRequest(
      product: product ?? this.product,
    );
  }
}
