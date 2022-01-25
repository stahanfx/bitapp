import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationResponse {
  int? status;
  List<Location>? result;

  LocationResponse({
    required this.status,
    required this.result,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}

@JsonSerializable()
class Location {
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

  Location({
    required this.id,
    required this.code,
    required this.sort,
    required this.pSort,
    required this.name,
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
