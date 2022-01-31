import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class FuserResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'result')
  int? result;

  FuserResponse({
    required this.status,
    required this.result,
  });

  factory FuserResponse.fromJson(Map<String, dynamic> json) =>
      _$FuserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FuserResponseToJson(this);
}

@JsonSerializable()
class RegistrationResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'result')
  RegistrationResult? result;

  RegistrationResponse({
    required this.status,
    required this.result,
  });

  factory RegistrationResponse.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationResponseToJson(this);
}

@JsonSerializable()
// ignore: must_be_immutable
class RegistrationResult extends Equatable {
  @JsonKey(name: 'MESSAGE')
  String? message;
  @JsonKey(name: 'TYPE')
  String? type;
  @JsonKey(name: 'ID')
  int? userId;
  @JsonKey(name: 'NEW_FUSER_ID')
  int? newFuserId;
  @JsonKey(name: 'USER_PHONE')
  String? userPhone;

  RegistrationResult({
    required this.message,
    required this.type,
    required this.userId,
    required this.userPhone,
  });

  factory RegistrationResult.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResultFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationResultToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'fuser_id')
  int? fuserId;
  @JsonKey(name: 'result')
  String? phoneNumber;

  UserModel({
    required this.userId,
    required this.fuserId,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
