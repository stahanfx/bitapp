import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/product/product_element/product_element_model.dart';
import 'package:dio/dio.dart';

class ApiProductElement {
  dynamic id;
  // String select;
  final client = Dio();

  ApiProductElement({
    required this.id,
    // required this.select,
  });

  Future<ProductElementResponse> getProductElement() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchProduct.getProductElement(),
      query: _queryGenerator(
        id: id,
      ),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = ProductElementResponse.fromJson(response);
    // responseData.status
    return responseData;
  }
}

_queryGenerator({
  required dynamic id,
}) {
  var query = 'ID=$id';
  return query;
}
