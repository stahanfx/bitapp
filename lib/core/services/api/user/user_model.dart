import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

//TODO:Перенести в USER!
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
class RegistrationResult extends Equatable {
  @JsonKey(name: 'MESSAGE')
  String? message;
  @JsonKey(name: 'TYPE')
  String? type;
  @JsonKey(name: 'ID')
  int? userId;
  @JsonKey(name: 'NEW_FUSER_ID')
  int? newFuserId;

  RegistrationResult({
    required this.message,
    required this.type,
    required this.userId,
  });

  factory RegistrationResult.fromJson(Map<String, dynamic> json) =>
      _$RegistrationResultFromJson(json);
  Map<String, dynamic> toJson() => _$RegistrationResultToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
