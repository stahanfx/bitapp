// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      status: json['status'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['ID'] as String?,
      code: json['CODE'] as String?,
      sort: json['SORT'] as String?,
      pSort: json['LT_SORT'] as String?,
      name: json['NAME'] as String?,
      address: json['ADDRESS'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'ID': instance.id,
      'CODE': instance.code,
      'SORT': instance.sort,
      'LT_SORT': instance.pSort,
      'NAME': instance.name,
      'ADDRESS': instance.address,
    };
