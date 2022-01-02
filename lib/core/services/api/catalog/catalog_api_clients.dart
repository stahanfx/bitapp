import 'dart:convert';
import 'dart:io';

import 'package:bitapp/core/services/api/api_path.dart';

import '../api_query.dart';
import '../global_parametrs.dart';
import 'catalog_model.dart';

class ApiCatalog {
  Map<String, dynamic> filter;
  String select;
  final client = HttpClient();

  ApiCatalog({required this.filter, required this.select, s});

  Future<CatalogResponse> getCatalogs() async {
    final url = Uri(
      scheme: baseSheme,
      host: baseHost,
      path: ApiPatchCatalog.categoryList(),
      query: queryGenerator(filter: filter, select: select),
    );
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final responseData = CatalogResponse.fromJson(json);
    return responseData;
  }
}
