import 'dart:convert';
import 'dart:io';
import 'package:bitapp/core/services/api/api_path.dart';

import '../api_query.dart';
import 'product_model.dart';

class ApiProduct {
  Map<String, String> filter;
  // String select;
  final client = HttpClient();

  ApiProduct({
    required this.filter,
    // required this.select,
  });

  Future<ProductResponse> getData() async {
    final url = Uri(
      scheme: baseSheme,
      host: baseHost,
      path: ApiPatchProduct.productGet(),
      query: queryGenerator2(
        filter: filter,
        // select: select,
      ),
    );
    final request = await client.getUrl(url);
    final response = await request.close();
    final json = await response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((v) => jsonDecode(v) as Map<String, dynamic>);
    final catalog = ProductResponse.fromJson(json);
    return catalog;
  }
}
