// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

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

RegistrationResponse _$RegistrationResponseFromJson(
        Map<String, dynamic> json) =>
    RegistrationResponse(
      status: json['status'] as int?,
      result: json['result'] == null
          ? null
          : RegistrationResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegistrationResponseToJson(
        RegistrationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
    };

RegistrationResult _$RegistrationResultFromJson(Map<String, dynamic> json) =>
    RegistrationResult(
      message: json['MESSAGE'] as String?,
      type: json['TYPE'] as String?,
      userId: json['ID'] as int?,
    )..newFuserId = json['NEW_FUSER_ID'] as int?;

Map<String, dynamic> _$RegistrationResultToJson(RegistrationResult instance) =>
    <String, dynamic>{
      'MESSAGE': instance.message,
      'TYPE': instance.type,
      'ID': instance.userId,
      'NEW_FUSER_ID': instance.newFuserId,
    };
