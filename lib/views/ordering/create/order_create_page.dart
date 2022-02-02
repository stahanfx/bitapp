import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/core/services/api/order/create/order_create_model.dart';
import 'package:bitapp/theme/styles/button_style.dart';
import 'package:bitapp/theme/widgets/elements/text_field_widget.dart';
import 'package:bitapp/views/ordering/create/order_create_page_model.dart';
import 'package:bitapp/views/ordering/location/location_page.dart';
import 'package:bitapp/views/ordering/payment/payment_arguments_models.dart';
import 'package:bitapp/views/ordering/payment/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:provider/provider.dart';

class OrderCreatePage extends StatefulWidget {
  const OrderCreatePage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderCreatePage> createState() => _OrderCreatePageState();
}

class _OrderCreatePageState extends State<OrderCreatePage> {
  final addressController = TextEditingController();
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = context.read<OrderCreatePageModel>();
    model.addUserInfo();
    return Scaffold(
        backgroundColor: AppColor.backgroun,
        appBar: AppBar(
          title: AppText.b16(value: "Оформление заказа", color: AppColor.black),
        ),
        body: Consumer<OrderCreatePageModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.05),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ]),
                    width: double.infinity,
                    height: 95,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  AppText.t12(
                                      value: 'Товары: ', color: AppColor.black),
                                  AppText.b12(
                                      value:
                                          '${model.basketToCreateModel?.totalPrice.toString()} руб.',
                                      color: AppColor.black),
                                ],
                              ),
                              Row(
                                children: [
                                  AppText.t12(
                                      value: 'Доставка: ',
                                      color: AppColor.black),
                                  AppText.b12(
                                      value:
                                          '${_nullStringer(model.deliveryToCreateModel?.deliveryPrice)} руб.',
                                      color: AppColor.black),
                                ],
                              ),
                              const SizedBox(height: 5),
                              AppText.b12(
                                  value: "Итого к оплате:",
                                  color: AppColor.black),
                              AppText.b20(
                                  value: '${_totalPriceCalc(
                                    basketPrice:
                                        model.basketToCreateModel?.totalPrice,
                                    deliveryPrice: model
                                        .deliveryToCreateModel?.deliveryPrice,
                                  )} руб.',
                                  color: AppColor.activeButton),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              style: AppButtonStuleElevated.textButton,
                              onPressed: () async {
                                OrderResponse responce = await model.postOrder(
                                    deliveryId:
                                        model.deliveryToCreateModel?.deliveryId,
                                    paymentId:
                                        model.paymentToCreateModel?.paymentId,
                                    shipmentAddress: addressController.text,
                                    userComment: commentController.text);
                                if (responce.result != null) {
                                  if (responce.result?.orderStatus == 'OK') {
                                    print("ВСЕ ЗАЕБИСЬ!");
                                  }
                                }
                              },
                              child: AppText.b12(
                                value: "Оформить заказ",
                                color: AppColor.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        _deliveryWidgetBuilder(model: model, context: context),
                        _paymentWidgetBuilder(model: model, context: context),
                        _fieldWidgetBuilder(
                          model: model,
                          context: context,
                          addressController: addressController,
                          commentController: commentController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}

_nullStringer(data) {
  if (data == null) {
    var result = '-';
    return result.toString();
  } else if (data == 0.0) {
    return 'Бесплатно';
  } else {
    return data.toString();
  }
}

_totalPriceCalc({deliveryPrice, basketPrice}) {
  if (deliveryPrice != null) {
    var result = deliveryPrice += basketPrice;
    return result.toString();
  } else {
    return basketPrice.toString();
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
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.b12(
                    value: "Выберите способ доставки", color: AppColor.black),
                const Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  } else {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LocationPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 60,
                      height: 60,
                      child: GetImageApi(
                          image: model?.deliveryToCreateModel?.deliveryLogo),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SizedBox(
                      width: 240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.b12(
                              value: model?.deliveryToCreateModel?.deliveryName,
                              color: AppColor.black),
                          AppText.t12(
                              value: model
                                  ?.deliveryToCreateModel?.deliveryDescription,
                              color: AppColor.black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.b12(
                                  value:
                                      "Срок:${model?.deliveryToCreateModel?.deliveryCity}",
                                  color: AppColor.black),
                              _getPrice(model: model),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _getPrice({required OrderCreatePageModel? model}) {
  if (model?.deliveryToCreateModel?.deliveryPrice == 0.0) {
    return AppText.b12(value: "Бесплатно", color: AppColor.activeButton);
  } else {
    return AppText.b12(
        value: "${model?.deliveryToCreateModel?.deliveryPrice} руб",
        color: AppColor.activeButton);
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
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]),
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.b12(
                      value: "Выберите способ оплаты", color: AppColor.black),
                  const Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderPaymentPage(
                    argument: OrderPaymentArgument(
                  deliveryCode: model?.deliveryToCreateModel?.deliveryId,
                )),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 80,
                        height: 50,
                        child: GetImageApi(
                            image: model?.paymentToCreateModel?.paymentLogo),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.b12(
                              value: model?.paymentToCreateModel?.paymentName,
                              color: AppColor.black),
                          AppText.t12(
                              value: model
                                  ?.paymentToCreateModel?.paymentDescription,
                              color: AppColor.black),
                        ],
                      ),
                    ),
                  ],
                ),
                // Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      );
    }
  }
  return Container();
}

Widget _fieldWidgetBuilder(
    {required OrderCreatePageModel? model,
    context,
    required addressController,
    required commentController}) {
  if (model?.paymentToCreateModel?.paymentId != null) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppTextField(
            lines: 3,
            hintString: "Введите адрес доставки",
            controllerValue: addressController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: AppTextField(
            lines: 3,
            hintString: "Введите комментарий к заказу",
            controllerValue: commentController,
          ),
        ),
      ],
    );
  }
  return Container();
}
