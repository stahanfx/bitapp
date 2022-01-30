// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderLocationResponse _$OrderLocationResponseFromJson(
        Map<String, dynamic> json) =>
    OrderLocationResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => LocationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderLocationResponseToJson(
        OrderLocationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

LocationItem _$LocationItemFromJson(Map<String, dynamic> json) => LocationItem(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      sort: json['SORT'] as String?,
      pSort: json['LT_SORT'] as String?,
      name: json['NAME'] as String?,
      address: json['ADDRESS'] as String?,
    );

Map<String, dynamic> _$LocationItemToJson(LocationItem instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'CODE': instance.code,
      'SORT': instance.sort,
      'LT_SORT': instance.pSort,
      'NAME': instance.name,
      'ADDRESS': instance.address,
    };
