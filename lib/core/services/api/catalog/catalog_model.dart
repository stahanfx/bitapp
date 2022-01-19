import 'package:json_annotation/json_annotation.dart';

part 'catalog_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  int? status;
  List<Category>? result;

  CategoryResponse({
    required this.status,
    required this.result,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class Category {
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

  Category({
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

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
