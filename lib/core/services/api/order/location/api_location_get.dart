import 'package:dio/dio.dart';

import '../../api_helper.dart';
import '../../api_path.dart';
import 'location_model.dart';

class ApiOrderLocationGet {
  static Future<OrderLocationResponse> location({required phrase}) async {
    _queryGeneratorGetLocation({required String phrase}) {
      return 'PHRASE=$phrase';
    }

    final client = Dio();
    String query = _queryGeneratorGetLocation(phrase: phrase);
    String patch = ApiPatchOrderGet.location();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return OrderLocationResponse.fromJson(response);
  }
}
