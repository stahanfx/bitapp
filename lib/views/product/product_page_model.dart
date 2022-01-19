import 'package:bitapp/core/services/api/product/product_element/product_element_api_clients.dart';
import 'package:bitapp/core/services/api/product/product_element/product_element_model.dart';
import 'package:flutter/material.dart';

class ProductPageModel with ChangeNotifier {
  var productElement = <ProductElement>[];

  Future getProductElement(id) async {
    final product = await ApiProductElement(
      id: id,
    ).getProductElement();
    // ignore: unnecessary_null_comparison
    if (product.result != null) {
      productElement += product.result;
      return product.result;
    } else {
      productElement.clear();
    }
  }
}
