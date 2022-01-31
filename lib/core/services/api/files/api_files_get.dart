import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import 'files_model.dart';

class ApiFileGet {
  static Future<FileResponse> file({required fileId}) async {
    _queryGeneratorGetFile({required fileId}) {
      return 'id=$fileId';
    }

    final client = Dio();
    String query = _queryGeneratorGetFile(fileId: fileId);
    String patch = ApiPatchFileGet.image();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return FileResponse.fromJson(response);
  }
}
