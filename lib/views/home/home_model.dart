import 'package:bitapp/core/services/api/catalog/catalog_api_clients.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_api_clients.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:flutter/material.dart';

class HomePageModel with ChangeNotifier {
  var categoryList = <Category>[];
  var productList = <Product>[];

  Future getCategory(filter, select) async {
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
    final product = await ApiProduct(
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
