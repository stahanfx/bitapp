import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_model.g.dart';

@JsonSerializable()
class BasketResponse {
  int? status;
  List<BasketItem>? result;

  BasketResponse({
    required this.status,
    required this.result,
  });

  factory BasketResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BasketResponseToJson(this);
}

@JsonSerializable()
// ignore: must_be_immutable
class BasketItem extends Equatable {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'FUSER_ID')
  String? fuserId;
  @JsonKey(name: 'PRODUCT_ID')
  String? productId;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'PRICE')
  double? price;
  @JsonKey(name: 'BASE_PRICE')
  double? basePrice;
  @JsonKey(name: 'DISCOUNT_PRICE')
  double? discountPrice;
  @JsonKey(name: 'CUSTOM_PRICE')
  double? customPrice;
  @JsonKey(name: 'CURRENCY')
  String? currency;
  @JsonKey(name: 'QUANTITY')
  double? quantity;

  BasketItem({
    required this.id,
    required this.fuserId,
    required this.productId,
    required this.name,
    required this.price,
    required this.basePrice,
    required this.discountPrice,
    required this.customPrice,
    required this.currency,
    required this.quantity,
  });

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);
  Map<String, dynamic> toJson() => _$BasketItemToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [id, quantity];
}
