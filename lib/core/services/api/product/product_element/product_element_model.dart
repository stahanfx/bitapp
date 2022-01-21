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

  @JsonKey(name: 'CML2_MANUFACTURER')
  Brand? brand;

  @JsonKey(name: 'GENRE_LIST')
  Gender? gender;

  @JsonKey(name: 'FAMILY_LIST')
  Family? family;

  @JsonKey(name: 'PROIZVODSTVO')
  Country? country;

  @JsonKey(name: 'SKU')
  List<SkuElement>? skuList;

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
    required this.skuList,
  });

  factory ProductElement.fromJson(Map<String, dynamic> json) =>
      _$ProductElementFromJson(json);
  Map<String, dynamic> toJson() => _$ProductElementToJson(this);
}

@JsonSerializable()
class Brand {
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'VALUE')
  String? value;

  Brand({
    required this.name,
    required this.active,
    required this.value,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

@JsonSerializable()
class Gender {
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'VALUE')
  List<dynamic>? value;

  Gender({
    required this.name,
    required this.active,
    //TODO: Пока ХЗ какой будет результат когда сюда прилетит массив, тестируем)))
    //Все равно надо потом будет вынести для фильтра
    required this.value,
  });

  factory Gender.fromJson(Map<String, dynamic> json) => _$GenderFromJson(json);
  Map<String, dynamic> toJson() => _$GenderToJson(this);
}

@JsonSerializable()
class Family {
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'VALUE')
  List<dynamic>? value;

  Family({
    required this.name,
    required this.active,
    required this.value,
  });

  factory Family.fromJson(Map<String, dynamic> json) => _$FamilyFromJson(json);
  Map<String, dynamic> toJson() => _$FamilyToJson(this);
}

@JsonSerializable()
class Country {
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'VALUE')
  String? value;

  Country({
    required this.name,
    required this.active,
    required this.value,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class SkuList {
  SkuElement? skuElement;

  SkuList({
    required this.skuElement,
  });

  factory SkuList.fromJson(Map<String, dynamic> json) =>
      _$SkuListFromJson(json);
  Map<String, dynamic> toJson() => _$SkuListToJson(this);
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
  Map<String, Properties>? skuProperties;

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
    required this.skuProperties,
    required this.skuPrice,
  });

  factory SkuElement.fromJson(Map<String, dynamic> json) =>
      _$SkuElementFromJson(json);
  Map<String, dynamic> toJson() => _$SkuElementToJson(this);
}

@JsonSerializable()
class Properties {
  ListProperties? listProperties;

  Properties({
    required this.listProperties,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}

@JsonSerializable()
class ListProperties {
  @JsonKey(name: 'ARTIKUL')
  VendorCode? vendorCode;
  @JsonKey(name: 'VID')
  SkuType? skuType;
  @JsonKey(name: 'OBEM')
  SkyVolume? skuVolume;
  @JsonKey(name: 'OBEM_CHISLOM')
  SkyVolumeNumber? skuVolumeNumber;

  ListProperties({
    required this.vendorCode,
    required this.skuType,
    required this.skuVolume,
    required this.skuVolumeNumber,
  });

  factory ListProperties.fromJson(Map<String, dynamic> json) =>
      _$ListPropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$ListPropertiesToJson(this);
}

@JsonSerializable()
class VendorCode {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'SEARCHABLE')
  String? searchable;
  @JsonKey(name: 'FILTRABLE')
  String? filtrable;
  @JsonKey(name: 'VALUE')
  String? value;

  VendorCode({
    required this.id,
    required this.name,
    required this.active,
    required this.searchable,
    required this.filtrable,
    required this.value,
  });

  factory VendorCode.fromJson(Map<String, dynamic> json) =>
      _$VendorCodeFromJson(json);
  Map<String, dynamic> toJson() => _$VendorCodeToJson(this);
}

@JsonSerializable()
class SkuType {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'SEARCHABLE')
  String? searchable;
  @JsonKey(name: 'FILTRABLE')
  String? filtrable;
  @JsonKey(name: 'VALUE')
  String? value;

  SkuType({
    required this.id,
    required this.name,
    required this.active,
    required this.searchable,
    required this.filtrable,
    required this.value,
  });

  factory SkuType.fromJson(Map<String, dynamic> json) =>
      _$SkuTypeFromJson(json);
  Map<String, dynamic> toJson() => _$SkuTypeToJson(this);
}

@JsonSerializable()
class SkyVolume {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'SEARCHABLE')
  String? searchable;
  @JsonKey(name: 'FILTRABLE')
  String? filtrable;
  @JsonKey(name: 'VALUE')
  String? value;

  SkyVolume({
    required this.id,
    required this.name,
    required this.active,
    required this.searchable,
    required this.filtrable,
    required this.value,
  });

  factory SkyVolume.fromJson(Map<String, dynamic> json) =>
      _$SkyVolumeFromJson(json);
  Map<String, dynamic> toJson() => _$SkyVolumeToJson(this);
}

@JsonSerializable()
class SkyVolumeNumber {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'SEARCHABLE')
  String? searchable;
  @JsonKey(name: 'FILTRABLE')
  String? filtrable;
  @JsonKey(name: 'VALUE')
  String? value;

  SkyVolumeNumber({
    required this.id,
    required this.name,
    required this.active,
    required this.searchable,
    required this.filtrable,
    required this.value,
  });

  factory SkyVolumeNumber.fromJson(Map<String, dynamic> json) =>
      _$SkyVolumeNumberFromJson(json);
  Map<String, dynamic> toJson() => _$SkyVolumeNumberToJson(this);
}

@JsonSerializable()
class Price {
  @JsonKey(name: 'BASE_PRICE')
  double? basePrice;
  @JsonKey(name: 'DISCOUNT_PRICE')
  double? discountPrice;
  @JsonKey(name: 'DISCOUNT')
  double? doscount;
  @JsonKey(name: 'PERCENT')
  double? percent;

  Price({
    required this.basePrice,
    required this.discountPrice,
    required this.doscount,
    required this.percent,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
