import 'package:bitapp/core/services/api/api_path.dart';
import 'package:dio/dio.dart';

import '../../../base/global_parametrs.dart';
import 'catalog_model.dart';

class ApiCatalog {
  Map<String, dynamic> filter;
  String select;
  final client = Dio();

  ApiCatalog({required this.filter, required this.select, s});

  Future<CategoryResponse> getCategory() async {
    final url = Uri(
      scheme: AppSettings.baseSheme,
      host: AppSettings.baseHost,
      path: ApiPatchCatalog.categoryList(),
      query: _queryGenerator(filter: filter, select: select),
    );
    final request = await client.get(url.toString());
    final response = await request.data;
    final responseData = CategoryResponse.fromJson(response);
    return responseData;
  }
}

_queryGenerator({
  required Map<String, dynamic> filter,
  required String select,
}) {
  var filterList = [];
  filter.forEach((key, value) {
    filterList.add('filter[$key]=$value&');
  });
  var filterResult = filterList.join();
  var selectResult = 'select=$select';

  var list = [
    filterResult,
    selectResult,
  ];

  var stringList = list.join("");
  return stringList;
}
