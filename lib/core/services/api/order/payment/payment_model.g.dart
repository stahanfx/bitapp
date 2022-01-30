// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOrderResponse _$PaymentOrderResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentOrderResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => PaymentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentOrderResponseToJson(
        PaymentOrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) => PaymentItem(
      id: json['ID'] as String?,
      name: json['NAME'] as String?,
      description: json['DESCRIPTION'] as String?,
      logo: json['LOGOTIP'] as String?,
    );

Map<String, dynamic> _$PaymentItemToJson(PaymentItem instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'DESCRIPTION': instance.description,
      'LOGOTIP': instance.logo,
    };
