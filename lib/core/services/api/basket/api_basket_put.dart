import 'package:dio/dio.dart';

import '../api_helper.dart';
import '../api_path.dart';

class ApiBasketPut {
  static Future product({required id, required quantity}) async {
    _queryGeneratorPutProduct({required String id, required quantity}) {
      return 'ID=$id&QUANTITY=$quantity&';
    }

    final client = Dio();
    String query = _queryGeneratorPutProduct(id: id, quantity: quantity);
    String patch = ApiPatchBasket.putProduct();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
