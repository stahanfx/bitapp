import 'package:bitapp/views/ordering/create/order_create_page_model.dart';
import 'package:bitapp/views/ordering/delivery/delivery_page_model.dart';
import 'package:bitapp/views/ordering/location/location_page.dart';
import 'package:bitapp/views/ordering/payment/payment_arguments_models.dart';
import 'package:bitapp/views/ordering/payment/payment_page.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:provider/provider.dart';

import 'order_arguments_models.dart';

class OrderCreatePage extends StatefulWidget {
  OrderCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

Future<void> _modelCreator() async {
  // var model = context.read<OrderCreatePageModel>();
}

class _OrderCreatePageState extends State<OrderCreatePage> {
  @override
  Widget build(BuildContext context) {
    var model = context.read<OrderCreatePageModel>();
    model.addUserInfo();
    return Scaffold(
        appBar: AppBar(
          title: AppText.b12(value: "Оформление заказа", color: AppColor.black),
        ),
        body: Consumer<OrderCreatePageModel>(
          builder: (context, model, child) {
            return Column(
              children: [
                AppText.b12(
                    value: model.basketToCreateModel?.totalPrice,
                    color: AppColor.black),
                AppText.b12(
                    value: model.userToCreateModel?.phone,
                    color: AppColor.black),
                _deliveryWidgetBuilder(model: model, context: context),
                _paymentWidgetBuilder(model: model, context: context)
              ],
            );
          },
        ));
  }
}

Widget _deliveryWidgetBuilder({required OrderCreatePageModel? model, context}) {
  if (model?.deliveryToCreateModel == null) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: AppColor.backgroun,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.b12(
                  value: "Выберите способ доставки", color: AppColor.black),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  } else {
    return AppText.b12(
        value: model?.deliveryToCreateModel?.deliveryId.toString(),
        color: AppColor.black);
  }
}

Widget _paymentWidgetBuilder({required OrderCreatePageModel? model, context}) {
  if (model?.deliveryToCreateModel?.deliveryId != null) {
    if (model?.paymentToCreateModel?.paymentId == null) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderPaymentPage(
                argument: OrderPaymentArgument(
                    deliveryCode: model?.deliveryToCreateModel?.deliveryId),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppColor.backgroun,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.b12(
                    value: "Выберите способ оплаты", color: AppColor.black),
                Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      );
    } else {
      return AppText.b12(
          value: model?.paymentToCreateModel?.paymentId.toString(),
          color: AppColor.black);
    }
  }
  return Container();
}
