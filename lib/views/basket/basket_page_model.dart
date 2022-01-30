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
    print(fuserId);
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

  Future<void> deleteItem({required productId}) async {
    final result = await ApiBasketDelete.product(productId: productId);
    if (result != null) await getList();
    notifyListeners();
  }

  Future<void> deleteBasket() async {
    await ApiBasketDelete.basket();
    await getList();
    notifyListeners();
  }

  Future<void> putItem({required id, required quantity}) async {
    final result = await ApiBasketPut.product(id: id, quantity: quantity);
    if (result != null) getList();
  }

//TODO: Надо держать модель пользователя
  Future getUserID() async {
    print(ApiUserGet.localUserID());
    return await ApiUserGet.localUserID();
  }
}
