import 'package:json_annotation/json_annotation.dart';

part 'product_item_model.g.dart';

@JsonSerializable()
class ProductItemResponse {
  int status;
  List<ProductItem> result;

  ProductItemResponse({
    required this.status,
    required this.result,
  });

  factory ProductItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductItemResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemResponseToJson(this);
}

@JsonSerializable()
class ProductItem {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'PREVIEW_PICTURE')
  String? previewPicture;
  @JsonKey(name: 'DETAIL_PICTURE')
  String? detailPicture;
  @JsonKey(name: 'DETAIL_TEXT')
  String? detailText;
  @JsonKey(name: 'BRAND')
  String? brand;
  @JsonKey(name: 'GENDER')
  String? gender;
  @JsonKey(name: 'FAMILY')
  String? family;
  @JsonKey(name: 'COUNTRY')
  String? country;
  @JsonKey(name: 'XML_ID')
  String? xmlId;

  @JsonKey(name: 'SKU')
  List<SkuItem>? skuItem;

  ProductItem({
    required this.id,
    required this.active,
    required this.name,
    required this.previewPicture,
    required this.detailPicture,
    required this.detailText,
    required this.brand,
    required this.gender,
    required this.family,
    required this.country,
    required this.skuItem,
    required this.xmlId,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);
  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class SkuItem {
  @JsonKey(name: 'ID')
  int? skuId;
  @JsonKey(name: 'ACTIVE')
  String? skuActive;
  @JsonKey(name: 'NAME')
  String? skuName;
  @JsonKey(name: 'PREVIEW_PICTURE')
  String? skuPrevievPicture;
  @JsonKey(name: 'DETAIL_PICTURE')
  String? skuDetailPicture;
  @JsonKey(name: 'QUANTITY')
  String? skuQuantity;

  @JsonKey(name: 'XML_ID')
  String? xmlId;

  @JsonKey(name: 'PARENT_ID')
  int? skuParentId;

  @JsonKey(name: 'PROPERTIES')
  SkuProperties? skuListProperties;
  @JsonKey(name: 'PRICE')
  Price? skuPrice;

  SkuItem({
    required this.skuId,
    required this.skuActive,
    required this.skuName,
    required this.skuPrevievPicture,
    required this.skuDetailPicture,
    required this.skuQuantity,
    required this.skuParentId,
    required this.skuListProperties,
    required this.skuPrice,
  });

  factory SkuItem.fromJson(Map<String, dynamic> json) =>
      _$SkuItemFromJson(json);
  Map<String, dynamic> toJson() => _$SkuItemToJson(this);
}

@JsonSerializable()
class SkuProperties {
  @JsonKey(name: 'ARTIKUL')
  String? vendorCode;
  @JsonKey(name: 'VID')
  String? skuType;
  @JsonKey(name: 'OBEM')
  String? skuVolume;
  @JsonKey(name: 'OBEM_CHISLOM')
  String? skuVolumeNumber;

  SkuProperties({
    required this.vendorCode,
    required this.skuType,
    required this.skuVolume,
    required this.skuVolumeNumber,
  });

  factory SkuProperties.fromJson(Map<String, dynamic> json) =>
      _$SkuPropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$SkuPropertiesToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: 'BASE_PRICE')
  double? basePrice;
  @JsonKey(name: 'DISCOUNT_PRICE')
  double? discountPrice;
  @JsonKey(name: 'DISCOUNT')
  double? discount;
  @JsonKey(name: 'PERCENT')
  double? percent;

  Price({
    required this.basePrice,
    required this.discountPrice,
    required this.discount,
    required this.percent,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
