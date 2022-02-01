class BasketToCreate {
  String? quantity;
  String? totalPrice;

  BasketToCreate({
    required this.quantity,
    required this.totalPrice,
  });
}

// class OrderCreate {
//   OrderUser? orderUser;
//   OrderDelivery? orderDelivery;
//   OrderPayment? orderPayment;

//   OrderCreate({
//     required this.orderUser,
//     required this.orderDelivery,
//     required this.orderPayment,
//   });
// }

class UserToCreate {
  int? userId;
  String? fio;
  String? name;
  String? phone;

  UserToCreate({
    required this.userId,
    required this.fio,
    required this.name,
    required this.phone,
  });
}

class DeliveryToCreate {
  String? deliveryId;
  String? deliveryName;
  String? deliveryDescription;
  String? deliveryCity;
  String? deliveryLogo;
  double? deliveryPrice;

  DeliveryToCreate({
    required this.deliveryId,
    required this.deliveryName,
    required this.deliveryDescription,
    required this.deliveryCity,
    required this.deliveryLogo,
    required this.deliveryPrice,
  });
}

class PaymentToCreate {
  String? paymentId;
  String? paymentName;
  String? paymentLogo;
  String? paymentDescription;

  PaymentToCreate({
    required this.paymentId,
    required this.paymentName,
    required this.paymentLogo,
    required this.paymentDescription,
  });
}
