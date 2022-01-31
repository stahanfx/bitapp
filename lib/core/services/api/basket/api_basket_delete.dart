import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import '../api_path.dart';

class ApiBasketDelete {
  static Future item({required itemId}) async {
    _queryGeneratorDeleteItem({required String itemId}) {
      return 'ITEM_ID=$itemId&';
    }

    final client = Dio();
    String query = _queryGeneratorDeleteItem(itemId: itemId);
    String patch = ApiPatchBasketDelete.item();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }

  static Future basket() async {
    _queryGeneratorDeleteAllBasket() async {
      var fuserId = await ApiUserGet.fuserID();
      return 'FUSER_ID=$fuserId&';
    }

    final client = Dio();
    String query = await _queryGeneratorDeleteAllBasket();
    String patch = ApiPatchBasketDelete.basket();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
