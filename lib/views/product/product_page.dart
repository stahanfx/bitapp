import 'package:bitapp/core/helper/text_clean.dart';
import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/theme/styles/button_style.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/basket/basket_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bitapp/core/services/api/product/product_element/product_element_model.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import 'product_arguments_models.dart';
import 'product_page_model.dart';

class ProductPage extends StatefulWidget {
  final ProductArgument? argument;
  const ProductPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _HomePageState();
}

class _HomePageState extends State<ProductPage> {
  List<ProductElement> productElement = [];

  Future<void> _getModel(argument) async {
    final model = context.watch<ProductPageModel>();
    productElement.clear();
    final categoryListData = await model.getProductElement(argument);
    productElement += categoryListData;
  }

  @override
  Widget build(BuildContext context) {
    ProductArgument argument = widget.argument as ProductArgument;

    return FutureBuilder(
      future: _getModel(argument.id),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: Text('Loading....'));
          default:
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else {
              return ProductBuilder(productElement: productElement.first);
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ProductBuilder extends StatelessWidget {
  ProductElement productElement;
  ProductBuilder({
    Key? key,
    required this.productElement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BasketPageModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.heart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'product');
                },
              ),
            ],
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 370.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: AppFonts.t12(
              //     value: productElement.name, color: AppColor().black),
              background: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppSize().h10 * 4, bottom: AppSize().h10 * 2),
                  child: GetImageApi(image: productElement.detailPicture),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppSize().w10, horizontal: AppSize().w10),
              child: Center(
                child: AppFonts.b14(
                    value: productElement.name, color: AppColor().black),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: AppFonts.b14(
                  value: "Торговые предложения", color: AppColor().black),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final sku = productElement.skuElement![index];
                return SizedBox(
                  height: 50.0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 220,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // AppFonts.b12(
                              //     value: "${productElement.name}",
                              //     color: AppColor().black),
                              AppFonts.b12(
                                  value:
                                      "${TextCleaner(baseText: sku.skuListProperties!.skuType.toString(), repText: "&quot;", newText: "").base()}",
                                  color: AppColor().black),
                              // AppFonts.t12(
                              //     value:
                              //         "Артикул: ${sku.skuListProperties?.vendorCode}",
                              //     color: AppColor().black),
                              AppFonts.t12(
                                  value:
                                      "Обьем: ${sku.skuListProperties?.skuVolumeNumber}мл",
                                  color: AppColor().black),
                              AppFonts.b12(
                                  value:
                                      "Цена: ${sku.skuPrice?.discountPrice.toString()}",
                                  color: AppColor().activeButton),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: AppButtonStuleElevated().textButton,
                          onPressed: () async {
                            await ApiBasketPost(filter: {
                              'FUSER_ID': await getFuser(),
                              'PRODUCT_ID': sku.skuId,
                              'PRICE': sku.skuPrice?.discountPrice,
                              //TODO: Поправить модель на получение данных(они есть)
                              'CURRENCY': 'RUB',
                              //TODO: Добавить в глобальные переменные
                              'LID': 's1',
                              'NAME': sku.skuName,
                              //TODO: Доделать чтоб было круто!
                              'QUANTITY': 1,
                              //TODO: Поправить модель на получение данных(они есть)
                              'CUSTOM_PRICE': 'Y',
                            }).postProduct();
                            await provider.getBasketList();
                          },
                          child: Text("В корзину"),
                        ),
                      ],
                    ),
                  ),
                );
                // }
              },
              childCount: productElement.skuElement?.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: AppFonts.b16(
                  value: "Характеристики", color: AppColor().black),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppFonts.t12(value: "Бренд:", color: AppColor().black),
                        AppFonts.t12(
                            value: productElement.brand,
                            color: AppColor().black),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppFonts.t12(value: "Пол:", color: AppColor().black),
                        AppFonts.t12(
                            value: productElement.gender,
                            color: AppColor().black),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppFonts.t12(
                            value: "Семейство:", color: AppColor().black),
                        AppFonts.t12(
                            value: productElement.family,
                            color: AppColor().black),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppFonts.t12(
                            value: "Производство:", color: AppColor().black),
                        AppFonts.t12(
                            value: productElement.country,
                            color: AppColor().black),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: AppFonts.b16(value: "Описание", color: AppColor().black),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                // top: AppSize().h10,
                bottom: AppSize().h10 * 10,
                left: AppSize().w10,
                right: AppSize().w10,
              ),
              child: AppFonts.t14(
                  value: productElement.detailText, color: AppColor().black),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: OverflowBar(
      //       overflowAlignment: OverflowBarAlignment.center,
      //       children: <Widget>[
      //         Container(
      //           color: Colors.amber,
      //           height: 60,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
