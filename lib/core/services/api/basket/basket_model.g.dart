// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuserResponse _$FuserResponseFromJson(Map<String, dynamic> json) =>
    FuserResponse(
      status: json['status'] as int?,
      result: json['result'] as int?,
    );

Map<String, dynamic> _$FuserResponseToJson(FuserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

BasketResponse _$BasketResponseFromJson(Map<String, dynamic> json) =>
    BasketResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => BasketProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BasketResponseToJson(BasketResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

BasketProduct _$BasketProductFromJson(Map<String, dynamic> json) =>
    BasketProduct(
      id: json['ID'] as String?,
      fuserId: json['FUSER_ID'] as String?,
      productId: json['PRODUCT_ID'] as String?,
      name: json['NAME'] as String?,
      price: json['PRICE'] as String?,
      basePrice: json['BASE_PRICE'] as String?,
      discountPrice: json['DISCOUNT_PRICE'] as String?,
      customPrice: json['CUSTOM_PRICE'] as String?,
      currency: json['CURRENCY'] as String?,
      quantity: json['QUANTITY'] as int?,
    );

Map<String, dynamic> _$BasketProductToJson(BasketProduct instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'FUSER_ID': instance.fuserId,
      'PRODUCT_ID': instance.productId,
      'NAME': instance.name,
      'PRICE': instance.price,
      'BASE_PRICE': instance.basePrice,
      'DISCOUNT_PRICE': instance.discountPrice,
      'CUSTOM_PRICE': instance.customPrice,
      'CURRENCY': instance.currency,
      'QUANTITY': instance.quantity,
    };
