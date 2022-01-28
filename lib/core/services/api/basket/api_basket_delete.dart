import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import '../api_path.dart';

class ApiBasketDelete {
  static Future product({required productId}) async {
    _queryGeneratorDeleteProduct({required String productId}) {
      return 'ID=$productId&';
    }

    final client = Dio();
    String query = _queryGeneratorDeleteProduct(productId: productId);
    String patch = ApiPatchBasket.deleteProduct();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }

  static Future basket() async {
    _queryGeneratorDeleteAllProduct() async {
      var fuserId = await ApiUserGet.fuserID();
      return 'FUSER=$fuserId&';
    }

    final client = Dio();
    String query = await _queryGeneratorDeleteAllProduct();
    String patch = ApiPatchBasket.deleteBasket();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
