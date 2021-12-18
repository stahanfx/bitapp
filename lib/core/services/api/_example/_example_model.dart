import 'package:json_annotation/json_annotation.dart';

part '_example_model.g.dart';

@JsonSerializable()
class CatalogResponse {
  int status;
  List<Catalog> result;

  CatalogResponse({
    required this.status,
    required this.result,
  });

  factory CatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$CatalogResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogResponseToJson(this);
}

@JsonSerializable()
class Catalog {
  @JsonKey(name: 'ID')
  String? id;

  Catalog({
    required this.id,
  });

  factory Catalog.fromJson(Map<String, dynamic> json) =>
      _$CatalogFromJson(json);
  Map<String, dynamic> toJson() => _$CatalogToJson(this);
}
