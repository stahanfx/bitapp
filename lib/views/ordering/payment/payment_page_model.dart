import 'package:bitapp/core/services/api/order/payment/api_payment_get.dart';
import 'package:bitapp/core/services/api/order/payment/payment_model.dart';

import 'package:flutter/material.dart';

class OrderPaymentPageModel with ChangeNotifier {
  var orderPaymentModel = <PaymentItem>[];

  Future getPaymentList({required deliveryId}) async {
    final paymentData =
        await ApiOrderPaymentGet.paymentList(deliveryId: deliveryId);
    if (paymentData.result != null) {
      orderPaymentModel = paymentData.result!;
      return paymentData.result;
    } else {}
    notifyListeners();
  }
}
