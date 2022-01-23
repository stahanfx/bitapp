import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/catalog/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'basket_page_model.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BasketPageModel>();
    provider.getBasketList();
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                print(getFuser());
              },
              child: const Text('GetFUSER')),
          SizedBox(
            height: 300,
            child: ListView.builder(
                // cacheExtent: 800,
                scrollDirection: Axis.vertical,
                itemCount: provider.basketModel.length,
                itemBuilder: (BuildContext context, int index) {
                  final basketElement = provider.basketModel[index];
                  return Center(
                    child: Column(
                      children: [
                        AppFonts.b14(
                            value: basketElement.name, color: AppColor().black),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
