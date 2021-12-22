import 'package:bitapp/core/services/api/catalog/catalog_api_clients.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_api_clients.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:flutter/material.dart';

class CatalogModel with ChangeNotifier {
  var catalogsList = <Catalog>[];
  var productList = <Product>[];

  Future<void> getCatalog(filter, select) async {
    final category =
        await ApiCatalog(filter: filter, select: select).getCatalogs();
    if (category.result != null) {
      catalogsList += category.result!;
    } else {
      catalogsList.clear();
    }
    notifyListeners();
  }

  Future getCatalogOne(filter, select) async {
    final category =
        await ApiCatalog(filter: filter, select: select).getCatalogs();
    if (category.result != null) {
      catalogsList += category.result!;
    } else {
      catalogsList.clear();
    }
    notifyListeners();
  }

  Future<void> getProduct(filter, select) async {
    final product = await ApiProduct(
      filter: filter,
      // select: select,
    ).getData();
    productList += product.result;
    notifyListeners();
  }
}
