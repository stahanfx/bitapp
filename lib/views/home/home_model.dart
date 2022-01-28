import 'package:bitapp/core/services/api/category/api_category_get.dart';
import 'package:bitapp/core/services/api/category/category_model.dart';
import 'package:bitapp/core/services/api/product/product_list/api_product_list_get.dart';
import 'package:bitapp/core/services/api/product/product_list/product_list_model.dart';
import 'package:flutter/material.dart';

class HomePageModel with ChangeNotifier {
  var categoryList = <CategoryItem>[];
  var productList = <ProductList>[];

  Future getCategory(filter, select) async {
    final category =
        await ApiCategoryGet.category(filter: filter, select: select);
    if (category.result != null) {
      categoryList += category.result!;
      return category.result;
    } else {
      categoryList.clear();
    }
    // notifyListeners();
  }

  Future getProduct(filter, select) async {
    final product = await ApiProductListGet.list(filter: filter);
    // ignore: unnecessary_null_comparison
    if (product.result != null) {
      productList += product.result;
      return product.result;
    } else {
      categoryList.clear();
    }
  }
}
