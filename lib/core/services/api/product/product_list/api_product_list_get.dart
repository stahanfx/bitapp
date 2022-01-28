import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';
import '../../api_helper.dart';
import 'product_list_model.dart';

class ApiProductListGet {
  static Future<ProductListResponse> list(
      {required Map<String, dynamic> filter}) async {
    _queryGeneratorProductListGet({required filter}) {
      var filterList = [];
      filter.forEach((key, value) {
        filterList.add('filter[$key]=$value&');
      });
      var filterResult = filterList.join("");
      var list = [filterResult];
      return list.join("");
    }

    final client = Dio();
    String query = _queryGeneratorProductListGet(filter: filter);
    String patch = ApiPatchProductGet.list();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = ProductListResponse.fromJson(response);
    return responseData;
  }
}
