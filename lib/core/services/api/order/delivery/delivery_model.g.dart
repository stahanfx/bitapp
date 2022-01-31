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
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      description: json['s'] as String?,
      logo: json['LOGOTIP'] as String?,
      xmlId: json['XML_ID'] as String?,
      price: (json['PRICE'] as num?)?.toDouble(),
      period: json['PERIOD_TEXT'] as String?,
    );

Map<String, dynamic> _$DeliveryItemToJson(DeliveryItem instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      's': instance.description,
      'PERIOD_TEXT': instance.period,
      'LOGOTIP': instance.logo,
      'XML_ID': instance.xmlId,
      'PRICE': instance.price,
    };
