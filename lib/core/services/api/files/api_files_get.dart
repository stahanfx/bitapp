import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import 'files_model.dart';

class ApiFileGet {
  static Future<FileResponse> file({required id}) async {
    _queryGeneratorGetFile({required id}) {
      return 'id=$id';
    }

    final client = Dio();
    String query = _queryGeneratorGetFile(id: id);
    String patch = ApiPatchFileGet.file();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return FileResponse.fromJson(response);
  }
}
