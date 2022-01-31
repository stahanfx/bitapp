import 'package:bitapp/core/services/api/basket/api_basket_delete.dart';
import 'package:bitapp/core/services/api/basket/api_basket_get.dart';
import 'package:bitapp/core/services/api/basket/api_basket_put.dart';

import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/core/services/api/user/api_user_get.dart';

import 'package:flutter/material.dart';

class BasketPageModel with ChangeNotifier {
  var basketModel = <BasketItem>[];

  Future<void> getList() async {
    final fuserId = await ApiUserGet.fuserID();
    final product = await ApiBasketGet.list(fuserId: fuserId);
    if (product.result != null) {
      if (basketModel != product.result) {
        basketModel = product.result!;
      }
    } else {
      basketModel = [];
    }
    notifyListeners();
  }

  Future<void> deleteItem({required itemId}) async {
    final result = await ApiBasketDelete.item(itemId: itemId);
    if (result != null) await getList();
    // notifyListeners();
  }

  Future<void> deleteBasket() async {
    await ApiBasketDelete.basket();
    await getList();
    // notifyListeners();
  }

  Future<void> putItem({required itemId, required quantity}) async {
    final result = await ApiBasketPut.item(itemId: itemId, quantity: quantity);
    if (result != null) getList();
  }
}
