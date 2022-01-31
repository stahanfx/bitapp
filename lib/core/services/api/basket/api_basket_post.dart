import 'package:dio/dio.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import '../api_helper.dart';

class ApiBasketPost {
  static Future item({required itemInfo}) async {
    _queryGeneratorPostItem({required Map<String, dynamic> itemInfo}) {
      var filterList = [];
      itemInfo.forEach((key, value) {
        filterList.add('$key=$value&');
      });
      var filterResult = filterList.join();
      var list = [filterResult];
      var stringList = list.join("");
      return stringList;
    }

    final client = Dio();
    String query = _queryGeneratorPostItem(itemInfo: itemInfo);
    String patch = ApiPatchBasketPost.item();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    return request.data;
  }
}
