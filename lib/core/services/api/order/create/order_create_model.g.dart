// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_create_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) =>
    OrderResponse(
      status: json['status'] as int?,
      result: json['result'] == null
          ? null
          : OrderResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

OrderResult _$OrderResultFromJson(Map<String, dynamic> json) => OrderResult(
      orderStatus: json['STATUS'] as String?,
      orderId: json['ORDER_ID'] as int?,
    );

Map<String, dynamic> _$OrderResultToJson(OrderResult instance) =>
    <String, dynamic>{
      'STATUS': instance.orderStatus,
      'ORDER_ID': instance.orderId,
    };
