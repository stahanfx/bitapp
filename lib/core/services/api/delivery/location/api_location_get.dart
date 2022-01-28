import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';

import '../../api_helper.dart';
import 'location_model.dart';

class ApiDeliveryGet {
  static Future<LocationResponse> location({required phrase}) async {
    _queryGeneratorGetLocation({required String phrase}) {
      return 'PHRASE=$phrase';
    }

    final client = Dio();
    String query = _queryGeneratorGetLocation(phrase: phrase);
    String patch = ApiPatchDeliveryGet.location();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return LocationResponse.fromJson(response);
  }
}
