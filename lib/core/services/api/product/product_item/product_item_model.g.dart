// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductItemResponse _$ProductItemResponseFromJson(Map<String, dynamic> json) =>
    ProductItemResponse(
      status: json['status'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductItemResponseToJson(
        ProductItemResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
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
      skuItem: (json['SKU'] as List<dynamic>?)
          ?.map((e) => SkuItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
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
      'SKU': instance.skuItem,
    };

SkuItem _$SkuItemFromJson(Map<String, dynamic> json) => SkuItem(
      skuId: json['ID'] as int?,
      skuActive: json['ACTIVE'] as String?,
      skuName: json['NAME'] as String?,
      skuPrevievPicture: json['PREVIEW_PICTURE'] as String?,
      skuDetailPicture: json['DETAIL_PICTURE'] as String?,
      skuQuantity: json['QUANTITY'] as String?,
      skuParentId: json['PARENT_ID'] as int?,
      skuListProperties: json['PROPERTIES'] == null
          ? null
          : SkuProperties.fromJson(json['PROPERTIES'] as Map<String, dynamic>),
      skuPrice: json['PRICE'] == null
          ? null
          : Price.fromJson(json['PRICE'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkuItemToJson(SkuItem instance) => <String, dynamic>{
      'ID': instance.skuId,
      'ACTIVE': instance.skuActive,
      'NAME': instance.skuName,
      'PREVIEW_PICTURE': instance.skuPrevievPicture,
      'DETAIL_PICTURE': instance.skuDetailPicture,
      'QUANTITY': instance.skuQuantity,
      'PARENT_ID': instance.skuParentId,
      'PROPERTIES': instance.skuListProperties,
      'PRICE': instance.skuPrice,
    };

SkuProperties _$SkuPropertiesFromJson(Map<String, dynamic> json) =>
    SkuProperties(
      vendorCode: json['ARTIKUL'] as String?,
      skuType: json['VID'] as String?,
      skuVolume: json['OBEM'] as String?,
      skuVolumeNumber: json['OBEM_CHISLOM'] as String?,
    );

Map<String, dynamic> _$SkuPropertiesToJson(SkuProperties instance) =>
    <String, dynamic>{
      'ARTIKUL': instance.vendorCode,
      'VID': instance.skuType,
      'OBEM': instance.skuVolume,
      'OBEM_CHISLOM': instance.skuVolumeNumber,
    };

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      basePrice: (json['BASE_PRICE'] as num?)?.toDouble(),
      discountPrice: (json['DISCOUNT_PRICE'] as num?)?.toDouble(),
      discount: (json['DISCOUNT'] as num?)?.toDouble(),
      percent: (json['PERCENT'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'BASE_PRICE': instance.basePrice,
      'DISCOUNT_PRICE': instance.discountPrice,
      'DISCOUNT': instance.discount,
      'PERCENT': instance.percent,
    };
