import 'package:bitapp/core/helper/text_cleaner.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/ordering/create/order_arguments_models.dart';
import 'package:bitapp/views/ordering/create/order_create_page.dart';
import 'package:bitapp/views/ordering/create/order_create_page_model.dart';
import 'package:bitapp/views/profile/profile_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'basket_page_model.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BasketPageModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: AppColor.backgroun,
        appBar: AppBar(
          actions: (model.basketModel.isEmpty)
              ? null
              : <Widget>[
                  IconButton(
                      onPressed: () async {},
                      icon: const Icon(FontAwesomeIcons.check))
                ],
          leading: IconButton(
              onPressed: () {
                model.deleteBasket();
              },
              icon: const Icon(FontAwesomeIcons.trashCanList)),
          title: AppText.b14(value: "Корзина", color: AppColor.black),
        ),
        body: BasketListWidget(model: model),
      );
    });
  }
}

// ignore: must_be_immutable
class BasketListWidget extends StatelessWidget {
  BasketPageModel model;
  BasketListWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerUser = context.read<ProfilePageModel>();
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 60,
            // color: AppColor.activeButton,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText.t12(
                          value:
                              "Тoваров: ${_calcBasketQuant(model.basketModel).toString()}",
                          color: AppColor.black),
                      AppText.b14(
                          value:
                              "Cумма заказа: ${_calcBasketPrice(model.basketModel).toString()}",
                          color: AppColor.black),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: (model.basketModel.isEmpty)
                      ? null
                      : ElevatedButton(
                          onPressed: () async {
                            var userId = providerUser.userModel?.userId;
                            if (userId == null) {
                              Navigator.pushNamed(
                                context,
                                'order/lightRegistration',
                              );
                            } else {
                              var providerCreateOrder =
                                  context.read<OrderCreatePageModel>();
                              providerCreateOrder.clanModel();
                              await providerCreateOrder.addBasketInfo(
                                  data: BasketToCreate(
                                      quantity:
                                          _calcBasketQuant(model.basketModel)
                                              .toString(),
                                      totalPrice:
                                          _calcBasketPrice(model.basketModel)
                                              .toString()));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderCreatePage(),
                                ),
                              );
                            }
                          },
                          child: AppText.b12(
                              value: "Формить заказ", color: AppColor.white)),
                ),
              ],
            )),
        Expanded(
          child: Consumer<BasketPageModel>(builder: (context, model, child) {
            return ListView.builder(
                padding: EdgeInsets.zero,
                // cacheExtent: 400,
                scrollDirection: Axis.vertical,
                itemCount: model.basketModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final basketElement = model.basketModel[index];
                  double priceItem = basketElement.price as double;
                  double countItem = basketElement.quantity as double;
                  double finalCost = priceItem * countItem;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Container(
                      color: AppColor.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: AppText.b12(
                                      value: TextCleaner(
                                              baseText:
                                                  basketElement.name.toString(),
                                              repText: '&quot;OUIFLACON&quot;',
                                              newText: '')
                                          .base(),
                                      color: AppColor.black),
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          await model.deleteItem(
                                              itemId: basketElement.id);
                                        },
                                        icon:
                                            const Icon(FontAwesomeIcons.trash)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          var plassQuantity =
                                              basketElement.quantity! + 1.0;
                                          await model.putItem(
                                            itemId: basketElement.id,
                                            quantity: plassQuantity,
                                          );
                                        },
                                        icon: const Icon(Icons.add)),
                                    Container(
                                      width: 30,
                                      height: 30,
                                      color: Colors.amber,
                                      child: Center(
                                        child: AppText.b14(
                                            value: basketElement.quantity
                                                .toString(),
                                            color: Colors.black),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          var minusQuantity =
                                              basketElement.quantity! - 1.0;
                                          await model.putItem(
                                            itemId: basketElement.id,
                                            quantity: minusQuantity,
                                          );
                                        },
                                        icon: const Icon(Icons.remove)),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AppText.t12(
                                        value: 'Стоимость: ',
                                        color: AppColor.black),
                                    AppText.b14(
                                        value: finalCost.toString(),
                                        color: AppColor.black),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }),
        ),
      ],
    );
  }
}

_calcBasketPrice(List<BasketItem> data) {
  double finalCost = 0;
  data.asMap().forEach((k, v) {
    var price = v.price;
    var quant = v.quantity;
    var costGroup = price! * quant!;
    finalCost += costGroup;
  });
  return finalCost;
}

_calcBasketQuant(List<BasketItem> data) {
  double finalQuant = 0;
  data.asMap().forEach((k, v) {
    var quant = v.quantity;
    finalQuant += quant!;
  });
  return finalQuant;
}
