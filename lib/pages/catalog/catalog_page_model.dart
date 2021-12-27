import 'package:bitapp/core/services/api/catalog/catalog_api_clients.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_api_clients.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:flutter/material.dart';

class CatalogPageModel with ChangeNotifier {
  var catalogsList = <Catalog>[];
  var productList = <Product>[];

  Future getCatalog(filter, select) async {
    final category =
        await ApiCatalog(filter: filter, select: select).getCatalogs();
    if (category.result != null) {
      catalogsList += category.result!;
      return category.result;
    } else {
      catalogsList.clear();
    }
    // notifyListeners();
  }

  Future getProduct(filter, select) async {
    final product = await ApiProduct(
      filter: filter,
      // select: select,
    ).getProduct();
    if (product.result != null) {
      productList += product.result;
      return product.result;
    } else {
      catalogsList.clear();
    }
  }
}
