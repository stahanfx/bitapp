import 'package:json_annotation/json_annotation.dart';

part 'product_element_model.g.dart';

@JsonSerializable()
class ProductElementResponse {
  int status;
  List<ProductElement> result;

  ProductElementResponse({
    required this.status,
    required this.result,
  });

  factory ProductElementResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductElementResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductElementResponseToJson(this);
}

@JsonSerializable()
class ProductElement {
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

  @JsonKey(name: 'SKU')
  List<SkuElement>? skuElement;

  ProductElement({
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
    required this.skuElement,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) =>
      _$ProductElementFromJson(json);
  Map<String, dynamic> toJson() => _$ProductElementToJson(this);
}

@JsonSerializable()
class SkuElement {
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
  @JsonKey(name: 'PARENT_ID')
  int? skuParentId;

  @JsonKey(name: 'PROPERTIES')
  SkuProperties? skuListProperties;

  @JsonKey(name: 'PRICE')
  Price? skuPrice;

  SkuElement({
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

  factory SkuElement.fromJson(Map<String, dynamic> json) =>
      _$SkuElementFromJson(json);
  Map<String, dynamic> toJson() => _$SkuElementToJson(this);
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
