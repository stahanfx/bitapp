// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListResponse _$ProductListResponseFromJson(Map<String, dynamic> json) =>
    ProductListResponse(
      status: json['status'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => ProductList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductListResponseToJson(
        ProductListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      id: json['ID'] as String?,
      createData: json['DATE_CREATE'] as String?,
      iblockID: json['IBLOCK_ID'] as String?,
      iblockSectionID: json['IBLOCK_SECTION_ID'] as String?,
      active: json['ACTIVE'] as String?,
      sort: json['SORT'] as String?,
      name: json['NAME'] as String?,
      previewPicture: json['PREVIEW_PICTURE'] as String?,
      previewText: json['PREVIEW_TEXT'] as String?,
      detailPicture: json['DETAIL_PICTURE'] as String?,
      unSections: json['IN_SECTIONS'] as String?,
      code: json['CODE'] as String?,
      externalId: json['EXTERNAL_ID'] as String?,
      price: json['PRICE'] as String?,
      currency: json['CURRENCY'] as String?,
      quanity: json['QUANTITY'] as String?,
      quanityReserved: json['QUANTITY_RESERVED'] as String?,
      properties: (json['PROPERTIES'] as List<dynamic>?)
          ?.map((e) => Properties.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'DATE_CREATE': instance.createData,
      'IBLOCK_ID': instance.iblockID,
      'IBLOCK_SECTION_ID': instance.iblockSectionID,
      'ACTIVE': instance.active,
      'SORT': instance.sort,
      'NAME': instance.name,
      'PREVIEW_PICTURE': instance.previewPicture,
      'PREVIEW_TEXT': instance.previewText,
      'DETAIL_PICTURE': instance.detailPicture,
      'IN_SECTIONS': instance.unSections,
      'CODE': instance.code,
      'EXTERNAL_ID': instance.externalId,
      'PRICE': instance.price,
      'CURRENCY': instance.currency,
      'QUANTITY': instance.quanity,
      'QUANTITY_RESERVED': instance.quanityReserved,
      'PROPERTIES': instance.properties,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      id: json['ID'] as String?,
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'ID': instance.id,
    };
