import 'package:json_annotation/json_annotation.dart';

part 'files_model.g.dart';

@JsonSerializable()
class FileResponse {
  int status;
  String result;

  FileResponse({
    required this.status,
    required this.result,
  });

  factory FileResponse.fromJson(Map<String, dynamic> json) =>
      _$FileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FileResponseToJson(this);
}
