import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import '../api_helper.dart';

class ApiBasketPost {
  static Future product({required productInfo}) async {
    _queryGeneratorPostProduct({required Map<String, dynamic> productInfo}) {
      var filterList = [];
      productInfo.forEach((key, value) {
        filterList.add('$key=$value&');
      });
      var filterResult = filterList.join();
      var list = [filterResult];
      var stringList = list.join("");
      return stringList;
    }

    final client = Dio();
    String query = _queryGeneratorPostProduct(productInfo: productInfo);
    String patch = ApiPatchBasket.postProduct();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
