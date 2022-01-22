// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_element_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductElementResponse _$ProductElementResponseFromJson(
        Map<String, dynamic> json) =>
    ProductElementResponse(
      status: json['status'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => ProductElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductElementResponseToJson(
        ProductElementResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

ProductElement _$ProductElementFromJson(Map<String, dynamic> json) =>
    ProductElement(
      id: json['ID'] as String?,
      active: json['ACTIVE'] as String?,
      name: json['NAME'] as String?,
      previewPicture: json['PREVIEW_PICTURE'] as String?,
      detailPicture: json['DETAIL_PICTURE'] as String?,
      detailText: json['DETAIL_TEXT'] as String?,
      brand: json['BRAND'] as String?,
      gender: json['GENDER'] as String?,
      family: json['FAMILY'] as String?,
      country: json['COUNTRY'] as String?,
      skuElement: (json['SKU'] as List<dynamic>?)
          ?.map((e) => SkuElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductElementToJson(ProductElement instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'ACTIVE': instance.active,
      'NAME': instance.name,
      'PREVIEW_PICTURE': instance.previewPicture,
      'DETAIL_PICTURE': instance.detailPicture,
      'DETAIL_TEXT': instance.detailText,
      'BRAND': instance.brand,
      'GENDER': instance.gender,
      'FAMILY': instance.family,
      'COUNTRY': instance.country,
      'SKU': instance.skuElement,
    };

SkuElement _$SkuElementFromJson(Map<String, dynamic> json) => SkuElement(
      skuId: json['ID'] as int?,
      skuActive: json['ACTIVE'] as String?,
      skuName: json['NAME'] as String?,
      skuPrevievPicture: json['PREVIEW_PICTURE'] as String?,
      skuDetailPicture: json['DETAIL_PICTURE'] as String?,
      skuQuantity: json['QUANTITY'] as String?,
      skuParentId: json['PARENT_ID'] as int?,
      skuListProperties: (json['PROP'] as List<dynamic>?)
          ?.map((e) => SkuListProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      skuPrice: json['PRICE'] == null
          ? null
          : Price.fromJson(json['PRICE'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkuElementToJson(SkuElement instance) =>
    <String, dynamic>{
      'ID': instance.skuId,
      'ACTIVE': instance.skuActive,
      'NAME': instance.skuName,
      'PREVIEW_PICTURE': instance.skuPrevievPicture,
      'DETAIL_PICTURE': instance.skuDetailPicture,
      'QUANTITY': instance.skuQuantity,
      'PARENT_ID': instance.skuParentId,
      'PROP': instance.skuListProperties,
      'PRICE': instance.skuPrice,
    };

SkuListProperties _$SkuListPropertiesFromJson(Map<String, dynamic> json) =>
    SkuListProperties(
      vendorCode: json['ARTIKUL'] == null
          ? null
          : SkuPropertiesData.fromJson(json['ARTIKUL'] as Map<String, dynamic>),
      skuType: json['VID'] == null
          ? null
          : SkuPropertiesData.fromJson(json['VID'] as Map<String, dynamic>),
      skuVolume: json['OBEM'] == null
          ? null
          : SkuPropertiesData.fromJson(json['OBEM'] as Map<String, dynamic>),
      skuVolumeNumber: json['OBEM_CHISLOM'] == null
          ? null
          : SkuPropertiesData.fromJson(
              json['OBEM_CHISLOM'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkuListPropertiesToJson(SkuListProperties instance) =>
    <String, dynamic>{
      'ARTIKUL': instance.vendorCode,
      'VID': instance.skuType,
      'OBEM': instance.skuVolume,
      'OBEM_CHISLOM': instance.skuVolumeNumber,
    };

SkuPropertiesData _$SkuPropertiesDataFromJson(Map<String, dynamic> json) =>
    SkuPropertiesData(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      searchable: json['SEARCHABLE'] as String?,
      filtrable: json['FILTRABLE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$SkuPropertiesDataToJson(SkuPropertiesData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'SEARCHABLE': instance.searchable,
      'FILTRABLE': instance.filtrable,
      'VALUE': instance.value,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      basePrice: (json['BASE_PRICE'] as num?)?.toDouble(),
      discountPrice: (json['DISCOUNT_PRICE'] as num?)?.toDouble(),
      doscount: (json['DISCOUNT'] as num?)?.toDouble(),
      percent: (json['PERCENT'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'BASE_PRICE': instance.basePrice,
      'DISCOUNT_PRICE': instance.discountPrice,
      'DISCOUNT': instance.doscount,
      'PERCENT': instance.percent,
    };
