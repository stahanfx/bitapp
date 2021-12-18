// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponse _$FileResponseFromJson(Map<String, dynamic> json) => FileResponse(
      status: json['status'] as int,
      result: json['result'] as String,
    );

Map<String, dynamic> _$FileResponseToJson(FileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };
