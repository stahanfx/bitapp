import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryResponse {
  int? status;
  List<CategoryItem>? result;

  CategoryResponse({
    required this.status,
    required this.result,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class CategoryItem {
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

  CategoryItem({
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

  factory CategoryItem.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryItemToJson(this);
}
