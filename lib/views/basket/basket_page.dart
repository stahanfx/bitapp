import 'package:bitapp/core/helper/text_clean.dart';
import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/catalog/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'basket_page_model.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  var model = [];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BasketPageModel>();

    return Scaffold(
      backgroundColor: AppColor().backgroun,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.check)),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, 'basket/location');
            },
            icon: Icon(FontAwesomeIcons.trashCanList)),
        title: AppFonts.b14(value: "Корзина", color: AppColor().black),
      ),
      body: BasketListWidget(),
    );
  }
}

class BasketListWidget extends StatelessWidget {
  const BasketListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BasketPageModel>(builder: (context, model, child) {
      return Column(
        children: [
          Container(
            width: double.infinity,
            height: 100,
            color: AppColor().activeButton,
            child: Column(
              children: [
                Center(
                  child: AppFonts.t16(
                      value: _calcBasketPrice(model.basketModel).toString(),
                      color: AppColor().black),
                ),
              ],
            ),
          ),
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
                        color: AppColor().white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: AppFonts.b12(
                                        value: TextCleaner(
                                                baseText: basketElement.name
                                                    .toString(),
                                                repText:
                                                    '&quot;OUIFLACON&quot;',
                                                newText: '')
                                            .base(),
                                        color: AppColor().black),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            await model.deleteBasketElement(
                                                basketElement.id);
                                          },
                                          icon: Icon(FontAwesomeIcons.trash)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            var newQuantity =
                                                basketElement.quantity! + 1.0;
                                            await model.putBasketElement(
                                                basketElement.id, newQuantity);
                                          },
                                          icon: Icon(Icons.add)),
                                      Container(
                                        width: 30,
                                        height: 30,
                                        color: Colors.amber,
                                        child: Center(
                                          child: AppFonts.b14(
                                              value: basketElement.quantity
                                                  .toString(),
                                              color: Colors.black),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            var newQuantity =
                                                basketElement.quantity! - 1.0;
                                            await model.putBasketElement(
                                                basketElement.id, newQuantity);
                                          },
                                          icon: Icon(Icons.remove)),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppFonts.t10(
                                          value: 'Стоимость: ',
                                          color: AppColor().black),
                                      AppFonts.b12(
                                          value: finalCost.toString(),
                                          color: AppColor().black),
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
    });
  }
}

_calcBasketPrice(List<BasketProduct> data) {
  double finalCost = 0;
  data.asMap().forEach((k, v) {
    var price = v.price;
    var quant = v.quantity;
    var costGroup = price! * quant!;
    finalCost += costGroup;
  });
  return finalCost;
}
