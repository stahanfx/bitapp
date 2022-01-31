import 'package:json_annotation/json_annotation.dart';

part 'delivery_model.g.dart';

@JsonSerializable()
class DeliveryOrderResponse {
  int? status;
  List<DeliveryItem>? result;

  DeliveryOrderResponse({
    required this.status,
    required this.result,
  });

  factory DeliveryOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$DeliveryOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryOrderResponseToJson(this);
}

@JsonSerializable()
class DeliveryItem {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 's')
  String? description;
  @JsonKey(name: 'PERIOD_TEXT')
  String? period;
  @JsonKey(name: 'LOGOTIP')
  String? logo;
  @JsonKey(name: 'XML_ID')
  String? xmlId;
  @JsonKey(name: 'PRICE')
  double? price;

  DeliveryItem({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.xmlId,
    required this.price,
    required this.period,
  });

  factory DeliveryItem.fromJson(Map<String, dynamic> json) =>
      _$DeliveryItemFromJson(json);
  Map<String, dynamic> toJson() => _$DeliveryItemToJson(this);
}
