import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../../api_helper.dart';
import 'product_item_model.dart';

class ApiProductItemGet {
  static Future<ProductItemResponse> poductItem({required id}) async {
    _queryGeneratorPrfoductItemResponce({required dynamic id}) {
      return 'ID=$id';
    }

    final client = Dio();
    String query = _queryGeneratorPrfoductItemResponce(id: id);
    String patch = ApiPatchProductGet.item();
    Uri url = ApiHelper().uriGenerator(query: query, patch: patch);
    final request = await client.get(url.toString());
    final response = await request.data;
    return ProductItemResponse.fromJson(response);
  }
}
