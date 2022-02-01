import 'package:bitapp/core/services/api/user/api_user_get.dart';
import 'package:bitapp/core/services/api/user/user_model.dart';
import 'package:flutter/material.dart';

import 'order_arguments_models.dart';

class OrderCreatePageModel with ChangeNotifier {
  BasketToCreate? basketToCreateModel;
  UserToCreate? userToCreateModel;
  DeliveryToCreate? deliveryToCreateModel;
  PaymentToCreate? paymentToCreateModel;

  Future<void> addBasketInfo({required BasketToCreate data}) async {
    if (data.totalPrice!.isNotEmpty) {
      basketToCreateModel = data;
      notifyListeners();
    }
  }

  Future<void> addUserInfo() async {
    UserModel userData = await ApiUserGet.userModel();
    var user = UserToCreate(
        userId: userData.userId,
        fio: userData.name,
        phone: userData.phoneNumber,
        name: userData.name);
    userToCreateModel = user;
    notifyListeners();
  }

  Future<void> addDeliveryInfo({required DeliveryToCreate deliveryData}) async {
    if (deliveryData.deliveryId!.isNotEmpty) {
      deliveryToCreateModel = deliveryData;
      notifyListeners();
    }
  }

  Future<void> addPaymentInfo({required PaymentToCreate paymentData}) async {
    if (paymentData.paymentId!.isNotEmpty) {
      paymentToCreateModel = paymentData;
      notifyListeners();
    }
  }
}
