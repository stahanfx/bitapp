import 'package:json_annotation/json_annotation.dart';

part 'catalog_model.g.dart';

@JsonSerializable()
class CatalogResponse {
  int? status;
  List<Catalog>? result;

  CatalogResponse({
    required this.status,
    required this.result,
  });

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogResponseToJson(this);
}

@JsonSerializable()
class Catalog {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'IBLOCK_ID')
  String? iblockId;
  @JsonKey(name: 'IBLOCK_SECTION_ID')
  String? iblockSectionId;
  @JsonKey(name: 'ACTIVE')
  String? active;
  @JsonKey(name: 'GLOBAL_ACTIVE')
  String? globalActive;
  @JsonKey(name: 'SORT')
  String? sort;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'PICTURE')
  String? picture;
  @JsonKey(name: 'DETAIL_PICTURE')
  String? detailPicture;
  @JsonKey(name: 'DESCRIPTION')
  String? description;
  @JsonKey(name: 'CODE')
  String? code;

  Catalog({
    required this.id,
    required this.iblockId,
    required this.iblockSectionId,
    required this.active,
    required this.globalActive,
    required this.sort,
    required this.name,
    required this.picture,
    required this.detailPicture,
    required this.description,
    required this.code,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
