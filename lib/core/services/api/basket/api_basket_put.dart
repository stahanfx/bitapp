import 'package:dio/dio.dart';

import '../api_helper.dart';
import '../api_path.dart';

class ApiBasketPut {
  static Future item({required itemId, required quantity}) async {
    _queryGeneratorPutItem({required String itemId, required quantity}) {
      return 'ITEM_ID=$itemId&QUANTITY=$quantity&';
    }

    final client = Dio();
    String query = _queryGeneratorPutItem(itemId: itemId, quantity: quantity);
    String patch = ApiPatchBasketPut.item();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
