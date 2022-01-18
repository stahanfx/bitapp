import 'package:bitapp/core/services/api/catalog/catalog_api_clients.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product_list/product_list_api_clients.dart';

import 'package:bitapp/core/services/api/product_list/product_list_model.dart';
import 'package:flutter/material.dart';

class CatalogPageModel with ChangeNotifier {
  var categoryList = <Category>[];
  var productList = <ProductList>[];

  Future getCatalog(filter, select) async {
    final category =
        await ApiCatalog(filter: filter, select: select).getCategory();
    if (category.result != null) {
      categoryList += category.result!;
      return category.result;
    } else {
      categoryList.clear();
    }
    // notifyListeners();
  }

  Future getProduct(filter, select) async {
    final product = await ApiProductList(
      filter: filter,
      // select: select,
    ).getProduct();
    // ignore: unnecessary_null_comparison
    if (product.result != null) {
      productList += product.result;
      return product.result;
    } else {
      categoryList.clear();
    }
  }
}
