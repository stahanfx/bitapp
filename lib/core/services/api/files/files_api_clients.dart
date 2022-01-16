import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../../../base/global_parametrs.dart';
import 'files_model.dart';

class ApiFile {
  String id;
  final client = Dio();

  ApiFile({
    required this.id,
  });

  Future<FileResponse> getFile() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchFile.imageGet(),
      query: 'id=$id',
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = FileResponse.fromJson(response);
    return responseData;
  }
}
