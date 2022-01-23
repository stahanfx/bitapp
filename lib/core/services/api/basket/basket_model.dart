import 'package:json_annotation/json_annotation.dart';

part 'basket_model.g.dart';

//TODO:Перенести в USER!
@JsonSerializable()
class FuserResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'result')
  int? result;

  FuserResponse({
    required this.status,
    required this.result,
  });

  factory FuserResponse.fromJson(Map<String, dynamic> json) =>
      _$FuserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FuserResponseToJson(this);
}

@JsonSerializable()
class BasketResponse {
  int? status;
  List<BasketProduct>? result;

  BasketResponse({
    required this.status,
    required this.result,
  });

  factory BasketResponse.fromJson(Map<String, dynamic> json) =>
      _$BasketResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BasketResponseToJson(this);
}

@JsonSerializable()
class BasketProduct {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'FUSER_ID')
  String? fuserId;
  @JsonKey(name: 'PRODUCT_ID')
  String? productId;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'PRICE')
  String? price;
  @JsonKey(name: 'BASE_PRICE')
  String? basePrice;
  @JsonKey(name: 'DISCOUNT_PRICE')
  String? discountPrice;
  @JsonKey(name: 'CUSTOM_PRICE')
  String? customPrice;
  @JsonKey(name: 'CURRENCY')
  String? currency;
  @JsonKey(name: 'QUANTITY')
  int? quantity;

  BasketProduct({
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

  factory BasketProduct.fromJson(Map<String, dynamic> json) =>
      _$BasketProductFromJson(json);
  Map<String, dynamic> toJson() => _$BasketProductToJson(this);
}
