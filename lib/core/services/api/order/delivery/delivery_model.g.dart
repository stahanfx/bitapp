// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliveryOrderResponse _$DeliveryOrderResponseFromJson(
        Map<String, dynamic> json) =>
    DeliveryOrderResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => DeliveryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DeliveryOrderResponseToJson(
        DeliveryOrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

DeliveryItem _$DeliveryItemFromJson(Map<String, dynamic> json) => DeliveryItem(
      id: json['DELIVERY_ID'] as String?,
      name: json['NAME'] as String?,
      period: json['PERIOD_TEXT'] as String?,
      description: json['DESCRIPTION'] as String?,
      logo: json['LOGOTIP'] as String?,
      xmlId: json['XML_ID'] as String?,
      price: (json['PRICE'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DeliveryItemToJson(DeliveryItem instance) =>
    <String, dynamic>{
      'NAME': instance.name,
      'PERIOD_TEXT': instance.period,
      'DELIVERY_ID': instance.id,
      'DESCRIPTION': instance.description,
      'LOGOTIP': instance.logo,
      'XML_ID': instance.xmlId,
      'PRICE': instance.price,
    };
