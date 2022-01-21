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
      brand: json['CML2_MANUFACTURER'] == null
          ? null
          : Brand.fromJson(json['CML2_MANUFACTURER'] as Map<String, dynamic>),
      gender: json['GENRE_LIST'] == null
          ? null
          : Gender.fromJson(json['GENRE_LIST'] as Map<String, dynamic>),
      family: json['FAMILY_LIST'] == null
          ? null
          : Family.fromJson(json['FAMILY_LIST'] as Map<String, dynamic>),
      country: json['PROIZVODSTVO'] == null
          ? null
          : Country.fromJson(json['PROIZVODSTVO'] as Map<String, dynamic>),
      skuList: (json['SKU'] as List<dynamic>?)
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
      'CML2_MANUFACTURER': instance.brand,
      'GENRE_LIST': instance.gender,
      'FAMILY_LIST': instance.family,
      'PROIZVODSTVO': instance.country,
      'SKU': instance.skuList,
    };

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'VALUE': instance.value,
    };

Gender _$GenderFromJson(Map<String, dynamic> json) => Gender(
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      value: json['VALUE'] as List<dynamic>?,
    );

Map<String, dynamic> _$GenderToJson(Gender instance) => <String, dynamic>{
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'VALUE': instance.value,
    };

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      value: json['VALUE'] as List<dynamic>?,
    );

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'VALUE': instance.value,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'VALUE': instance.value,
    };

SkuList _$SkuListFromJson(Map<String, dynamic> json) => SkuList(
      skuElement: json['skuElement'] == null
          ? null
          : SkuElement.fromJson(json['skuElement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SkuListToJson(SkuList instance) => <String, dynamic>{
      'skuElement': instance.skuElement,
    };

SkuElement _$SkuElementFromJson(Map<String, dynamic> json) => SkuElement(
      skuId: json['ID'] as int?,
      skuActive: json['ACTIVE'] as String?,
      skuName: json['NAME'] as String?,
      skuPrevievPicture: json['PREVIEW_PICTURE'] as String?,
      skuDetailPicture: json['DETAIL_PICTURE'] as String?,
      skuQuantity: json['QUANTITY'] as String?,
      skuParentId: json['PARENT_ID'] as int?,
      skuProperties: (json['PROPERTIES'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Properties.fromJson(e as Map<String, dynamic>)),
      ),
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
      'PROPERTIES': instance.skuProperties,
      'PRICE': instance.skuPrice,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      listProperties: json['listProperties'] == null
          ? null
          : ListProperties.fromJson(
              json['listProperties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'listProperties': instance.listProperties,
    };

ListProperties _$ListPropertiesFromJson(Map<String, dynamic> json) =>
    ListProperties(
      vendorCode: json['ARTIKUL'] == null
          ? null
          : VendorCode.fromJson(json['ARTIKUL'] as Map<String, dynamic>),
      skuType: json['VID'] == null
          ? null
          : SkuType.fromJson(json['VID'] as Map<String, dynamic>),
      skuVolume: json['OBEM'] == null
          ? null
          : SkyVolume.fromJson(json['OBEM'] as Map<String, dynamic>),
      skuVolumeNumber: json['OBEM_CHISLOM'] == null
          ? null
          : SkyVolumeNumber.fromJson(
              json['OBEM_CHISLOM'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListPropertiesToJson(ListProperties instance) =>
    <String, dynamic>{
      'ARTIKUL': instance.vendorCode,
      'VID': instance.skuType,
      'OBEM': instance.skuVolume,
      'OBEM_CHISLOM': instance.skuVolumeNumber,
    };

VendorCode _$VendorCodeFromJson(Map<String, dynamic> json) => VendorCode(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      searchable: json['SEARCHABLE'] as String?,
      filtrable: json['FILTRABLE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$VendorCodeToJson(VendorCode instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'SEARCHABLE': instance.searchable,
      'FILTRABLE': instance.filtrable,
      'VALUE': instance.value,
    };

SkuType _$SkuTypeFromJson(Map<String, dynamic> json) => SkuType(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      searchable: json['SEARCHABLE'] as String?,
      filtrable: json['FILTRABLE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$SkuTypeToJson(SkuType instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'SEARCHABLE': instance.searchable,
      'FILTRABLE': instance.filtrable,
      'VALUE': instance.value,
    };

SkyVolume _$SkyVolumeFromJson(Map<String, dynamic> json) => SkyVolume(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      searchable: json['SEARCHABLE'] as String?,
      filtrable: json['FILTRABLE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$SkyVolumeToJson(SkyVolume instance) => <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'ACTIVE': instance.active,
      'SEARCHABLE': instance.searchable,
      'FILTRABLE': instance.filtrable,
      'VALUE': instance.value,
    };

SkyVolumeNumber _$SkyVolumeNumberFromJson(Map<String, dynamic> json) =>
    SkyVolumeNumber(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      active: json['ACTIVE'] as String?,
      searchable: json['SEARCHABLE'] as String?,
      filtrable: json['FILTRABLE'] as String?,
      value: json['VALUE'] as String?,
    );

Map<String, dynamic> _$SkyVolumeNumberToJson(SkyVolumeNumber instance) =>
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
