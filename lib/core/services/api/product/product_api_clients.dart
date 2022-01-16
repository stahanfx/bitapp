import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../../../base/global_parametrs.dart';
import 'product_model.dart';

class ApiProduct {
  Map<String, String> filter;
  // String select;
  final client = Dio();

  ApiProduct({
    required this.filter,
    // required this.select,
  });

  Future<ProductResponse> getProduct() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchProduct.productGet(),
      query: _queryGenerator(
        filter: filter,
        // select: select,
      ),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = ProductResponse.fromJson(response);
    return responseData;
  }
}

_queryGenerator({
  required Map<String, dynamic> filter,
}) {
  var filterList = [];
  filter.forEach((key, value) {
    filterList.add('filter[$key]=$value&');
  });
  var filterResult = filterList.join("");

  var list = [
    filterResult,
  ];

  var stringList = list.join("");
  return stringList;
}
