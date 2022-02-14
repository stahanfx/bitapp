import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../api_helper.dart';
import 'category_model.dart';

class ApiCategoryGet {
  static Future<CategoryResponse> category(
      {required Map<String, dynamic> filter, required String select}) async {
    _queryGeneratorGetCategory({required filter, required select}) {
      var filterList = [];
      filter.forEach((key, value) {
        filterList.add('filter[$key]=$value&');
      });
      var filterResult = filterList.join();
      var selectResult = 'select=$select';
      var list = [filterResult, selectResult];
      return list.join("");
    }

    final client = Dio();
    client.options.headers["Access-Control-Allow-Origin"] = "*";
    String query = _queryGeneratorGetCategory(filter: filter, select: select);
    String patch = ApiPatchCategoryGet.list();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;

    final responseData = CategoryResponse.fromJson(response);
    return responseData;
  }
}
