// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_example_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogResponse _$CatalogResponseFromJson(Map<String, dynamic> json) =>
    CatalogResponse(
      status: json['status'] as int,
      result: (json['result'] as List<dynamic>)
          .map((e) => Catalog.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatalogResponseToJson(CatalogResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

Catalog _$CatalogFromJson(Map<String, dynamic> json) => Catalog(
      id: json['ID'] as String?,
    );

Map<String, dynamic> _$CatalogToJson(Catalog instance) => <String, dynamic>{
      'ID': instance.id,
    };
