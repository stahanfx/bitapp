import 'package:bitapp/core/services/api/product/product_item/api_product_item_get.dart';
import 'package:bitapp/core/services/api/product/product_item/product_item_model.dart';
import 'package:flutter/material.dart';

class ProductPageModel with ChangeNotifier {
  var productElement = <ProductItem>[];

  Future getProductItem(id) async {
    final product = await ApiProductItemGet.poductItem(id: id);
    // ignore: unnecessary_null_comparison
    if (product.result != null) {
      productElement += product.result;
      return product.result;
    } else {
      productElement.clear();
    }
  }
}
