import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import 'basket_model.dart';

class ApiBasketGet {
  static Future<BasketResponse> list({required fuserId}) async {
    _queryGeneratorGetList({required fuserId}) {
      return 'FUSER_ID=$fuserId&';
    }

    final client = Dio();
    String query = _queryGeneratorGetList(fuserId: fuserId);
    String patch = ApiPatchBasket.getList();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = request.data;
    return BasketResponse.fromJson(response);
  }
}
