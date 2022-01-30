import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentOrderResponse {
  int? status;
  List<PaymentItem>? result;

  PaymentOrderResponse({
    required this.status,
    required this.result,
  });

  factory PaymentOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentOrderResponseToJson(this);
}

@JsonSerializable()
class PaymentItem {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'DESCRIPTION')
  String? description;
  @JsonKey(name: 'LOGOTIP')
  String? logo;

  PaymentItem({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
  });

  factory PaymentItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentItemToJson(this);
}
