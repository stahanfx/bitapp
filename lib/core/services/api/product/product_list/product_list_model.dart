import 'package:json_annotation/json_annotation.dart';

part 'product_list_model.g.dart';

@JsonSerializable()
class ProductListResponse {
  int status;
  List<ProductList> result;

  ProductListResponse({
    required this.status,
    required this.result,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);
}

@JsonSerializable()
class ProductList {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'DATE_CREATE')
  String? createData;
  @JsonKey(name: 'IBLOCK_ID')
  String? iblockID;
  @JsonKey(name: 'IBLOCK_SECTION_ID')
  String? iblockSectionID;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'SORT')
  String? sort;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'PREVIEW_PICTURE')
  String? previewPicture;
  @JsonKey(name: 'PREVIEW_TEXT')
  String? previewText;
  @JsonKey(name: 'DETAIL_PICTURE')
  String? detailText;
  @JsonKey(name: 'IN_SECTIONS')
  String? unSections;
  @JsonKey(name: 'CODE')
  String? code;
  @JsonKey(name: 'EXTERNAL_ID')
  String? externalId;
  @JsonKey(name: 'PRICE')
  String? price;
  @JsonKey(name: 'CURRENCY')
  String? currency;
  @JsonKey(name: 'QUANTITY')
  String? quanity;
  @JsonKey(name: 'QUANTITY_RESERVED')
  String? quanityReserved;
  @JsonKey(name: 'PROPERTIES')
  List<Properties>? properties;

  ProductList({
    required this.id,
    required this.createData,
    required this.iblockID,
    required this.iblockSectionID,
    required this.active,
    required this.sort,
    required this.name,
    required this.previewPicture,
    required this.previewText,
    required this.detailText,
    required this.unSections,
    required this.code,
    required this.externalId,
    required this.price,
    required this.currency,
    required this.quanity,
    required this.quanityReserved,
    required this.properties,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListToJson(this);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: 'ID')
  String? id;

  Properties({
    required this.id,
  });

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesToJson(this);
}
