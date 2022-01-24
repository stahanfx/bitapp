import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class BasketPageModel with ChangeNotifier {
  var basketModel = <BasketProduct>[];

  Future<void> getBasketList() async {
    final fuserId = await getFuser();
    final product = await ApiBasketGet(filter: fuserId).getList();

    if (product.result != null) {
      if (basketModel != product.result) {
        basketModel = product.result!;
      }
    } else {
      basketModel = [];
    }
    notifyListeners();
  }

  Future deleteBasketElement(
    id,
  ) async {
    final result = await ApiBasketDelete(id: id).deleteProduct();

    if (result != null) {
      getBasketList();
    }
    notifyListeners();
  }

  Future putBasketElement(id, quantity) async {
    final result = await ApiBasketPut(id: id, quantity: quantity).putProduct();

    if (result != null) {
      getBasketList();
    }
  }
}

Future getFuser() async {
  var box = await Hive.openBox('fuserBox');

  if (box.isEmpty) {
    final newFuser = await ApiBasketGet(filter: 0).getFuser();
    box.put('fuser', newFuser.result);
  }
  final response = await box.get('fuser');
  box.close();
  print(response);
  return response;
}
