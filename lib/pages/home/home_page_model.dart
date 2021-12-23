import 'package:bitapp/core/services/api/catalog/catalog_api_clients.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:flutter/material.dart';

class HomePageModel with ChangeNotifier {
  var catalogsList = <Catalog>[];

  Future<void> getCatalog(filter, select) async {
    final category =
        await ApiCatalog(filter: filter, select: select).getCatalogs();
    catalogsList += category.result!;
    notifyListeners();
  }

  void clearCatalog() {
    catalogsList = <Catalog>[];
  }
}
