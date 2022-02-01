import 'package:bitapp/core/services/api/file/image_services.dart';
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
          title: AppText.b12(value: "Оформление заказа", color: AppColor.black),
        ),
        body: Consumer<OrderCreatePageModel>(
          builder: (context, model, child) {
            return ListView(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _deliveryWidgetBuilder(
                              model: model, context: context),
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
                    Container(
                        color: AppColor.white,
                        width: double.infinity,
                        height: 100,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.b12(
                                      value: "Итого к оплате:",
                                      color: AppColor.black),
                                  AppText.b18(
                                      value:
                                          model.basketToCreateModel?.totalPrice,
                                      color: AppColor.activeButton),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: () {
                                      model.postOrder(
                                          deliveryId: model
                                              .deliveryToCreateModel
                                              ?.deliveryId,
                                          paymentId: model
                                              .paymentToCreateModel?.paymentId,
                                          shipmentAddress:
                                              addressController.text,
                                          userComment: commentController.text);
                                    },
                                    child: AppText.b12(
                                      value: "Оформить заказ",
                                      color: AppColor.white,
                                    )),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
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
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: AppColor.white,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppText.b12(
                    value: "Выберите способ доставки", color: AppColor.black),
              ),
              const Icon(Icons.arrow_right),
            ],
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
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: AppColor.white,
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
                          image: model?.deliveryToCreateModel?.deliveryLogo),
                    ),
                  ),
                  SizedBox(
                    width: 250,
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
                                    "Срок: ${model?.deliveryToCreateModel?.deliveryCity}",
                                color: AppColor.black),
                            _getPrice(model: model),
                          ],
                        ),
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
      return Padding(
        padding: const EdgeInsets.all(10.0),
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
            color: AppColor.white,
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
          padding: const EdgeInsets.all(10.0),
          child: AppTextField(
            lines: 3,
            hintString: "Адрес доставки",
            controllerValue: addressController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: AppTextField(
            lines: 3,
            hintString: "Комментарий",
            controllerValue: commentController,
          ),
        ),
      ],
    );
  }
  return Container();
}
