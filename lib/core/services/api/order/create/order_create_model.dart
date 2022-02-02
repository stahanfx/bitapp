import 'package:json_annotation/json_annotation.dart';

part 'order_create_model.g.dart';

@JsonSerializable()
class OrderResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'result')
  OrderResult? result;

  OrderResponse({
    required this.status,
    required this.result,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);
}

@JsonSerializable()
class OrderResult {
  @JsonKey(name: 'STATUS')
  String? orderStatus;
  @JsonKey(name: 'ORDER_ID')
  int? orderId;

  OrderResult({
    required this.orderStatus,
    required this.orderId,
  });

  factory OrderResult.fromJson(Map<String, dynamic> json) =>
      _$OrderResultFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResultToJson(this);
}
