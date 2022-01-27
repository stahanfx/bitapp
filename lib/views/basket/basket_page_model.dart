import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/core/services/api/user/user_api_client.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BasketPageModel with ChangeNotifier {
  var basketModel = <BasketProduct>[];

  Future<void> getBasketList() async {
    final fuserId = await UserApiGet().getLocalFuser();
    print(fuserId);
    final product = await ApiBasketGet().getList(fuserId: fuserId);
    if (product.result != null) {
      if (basketModel != product.result) {
        basketModel = product.result!;
      }
    } else {
      basketModel = [];
    }
    notifyListeners();
  }

  Future<void> deleteBasketElement(id) async {
    final result = await ApiBasketDelete().deleteProduct(id: id);
    if (result != null) await getBasketList();
    notifyListeners();
  }

  Future<void> deleteAllBasketElement() async {
    final result = await ApiBasketDelete().deleteAllProduct();
    print("Корзина очищена");
    await getBasketList();
    notifyListeners();
  }

  Future putBasketElement(id, quantity) async {
    final result = await ApiBasketPut().putProduct(id: id, quantity: quantity);
    if (result != null) getBasketList();
  }

  Future getUserID() async {
    final result = await UserApiGet().getLocalUserId();
    return result;
  }
}
