import 'package:bitapp/core/services/api/order/delivery/api_delivery_get.dart';
import 'package:bitapp/core/services/api/order/delivery/delivery_model.dart';

import 'package:flutter/material.dart';

class OrderDeliveryPageModel with ChangeNotifier {
  var orderDeliveryModel = <DeliveryItem>[];

  Future getDeliveryList({required locationCode}) async {
    final deliveryData =
        await ApiOrderDeliveryGet.deliveryList(locationCode: locationCode);
    if (deliveryData.result != null) {
      orderDeliveryModel = deliveryData.result!;
      return deliveryData.result;
    } else {}
    notifyListeners();
  }
}
