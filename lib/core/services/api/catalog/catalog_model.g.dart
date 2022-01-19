// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['ID'] as String?,
      iblockId: json['IBLOCK_ID'] as String?,
      iblockSectionId: json['IBLOCK_SECTION_ID'] as String?,
      active: json['ACTIVE'] as String?,
      globalActive: json['GLOBAL_ACTIVE'] as String?,
      sort: json['SORT'] as String?,
      name: json['NAME'] as String?,
      picture: json['PICTURE'] as String?,
      detailPicture: json['DETAIL_PICTURE'] as String?,
      description: json['DESCRIPTION'] as String?,
      code: json['CODE'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'ID': instance.id,
      'IBLOCK_ID': instance.iblockId,
      'IBLOCK_SECTION_ID': instance.iblockSectionId,
      'ACTIVE': instance.active,
      'GLOBAL_ACTIVE': instance.globalActive,
      'SORT': instance.sort,
      'NAME': instance.name,
      'PICTURE': instance.picture,
      'DETAIL_PICTURE': instance.detailPicture,
      'DESCRIPTION': instance.description,
      'CODE': instance.code,
    };
