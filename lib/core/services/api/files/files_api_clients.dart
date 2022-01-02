import 'dart:convert';
import 'dart:io';

import 'package:bitapp/core/services/api/api_path.dart';

import '../global_parametrs.dart';
import 'files_model.dart';

class ApiFile {
  String id;
  final client = HttpClient();

  ApiFile({
    required this.id,
  });

  Future<FileResponse> getFile() async {
    final url = Uri(
      scheme: baseSheme,
      host: baseHost,
      path: ApiPatchFile.imageGet(),
      query: 'id=$id',
    );
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final file = FileResponse.fromJson(json);
    return file;
  }
}
