import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class OrderLocationResponse {
  int? status;
  List<LocationItem>? result;

  OrderLocationResponse({
    required this.status,
    required this.result,
  });

  factory OrderLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderLocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderLocationResponseToJson(this);
}

@JsonSerializable()
class LocationItem {
  @JsonKey(name: 'ID')
  String? id;
  @JsonKey(name: 'CODE')
  String? code;
  @JsonKey(name: 'SORT')
  String? sort;
  @JsonKey(name: 'LT_SORT')
  String? pSort;
  @JsonKey(name: 'NAME')
  String? name;
  @JsonKey(name: 'ADDRESS')
  String? address;

  LocationItem({
    required this.id,
    required this.code,
    required this.sort,
    required this.pSort,
    required this.name,
    required this.address,
  });

  factory LocationItem.fromJson(Map<String, dynamic> json) =>
      _$LocationItemFromJson(json);
  Map<String, dynamic> toJson() => _$LocationItemToJson(this);
}
