import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';

import 'catalog_page_model.dart';

class CatalogPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Argument? argument;
  const CatalogPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
//Инициализируем базовые данные
//Фргументы
// - Обьявляем переменные модели
  var catalogListModel = <Catalog>[];
  var productListModel = <Product>[];

//Обьявляем методы
// - Методы локальной модели
  Future<void> _getModel(argument) async {
    final provider = context.watch<CatalogPageModel>();
    catalogListModel.clear();
    final catalogListData = await provider.getCatalog(
        {'SECTION_ID': '$argument', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    if (catalogListData != null) {
      catalogListModel += catalogListData;
    }

    // productListModel.clear();
    final productListData = await provider.getProduct(
        {'SECTION_ID': '$argument', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    if (productListData != null) {
      productListModel += productListData;
    }
    for (var element in catalogListModel) {
      final productListData = await provider.getProduct(
          {'SECTION_ID': '${element.id}', 'IBLOCK_ID': baseTradeCatalog},
          'light');
      if (productListData != null) {
        productListModel += productListData;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Argument argument = widget.argument as Argument;
    return FutureBuilder(
      future: _getModel(argument.id),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: SizedBox(
                  height: 30, width: 30, child: CircularProgressIndicator()),
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Scaffold(
                backgroundColor: bitAppColorBackgroun,
                appBar: AppBar(
                  title: BitAppFonts.body_2_2(
                      value: '${argument.title}', color: bitAppColorBlack),
                  leading: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: bitAppColorWhite,
                        ),
                        child: BitAppButtonIcon.appBar(
                            onPressed: () {},
                            icon: FontAwesomeIcons.chevronLeft),
                      ),
                    ),
                  ),
                  actions: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: 36,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: bitAppColorWhite,
                          ),
                          child: BitAppButtonIcon.appBar(
                              onPressed: () {}, icon: Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: bitAppColorWhite,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5.w),
                            // BitAppButtonIcon.appBar(
                            //     onPressed: () {},
                            //     icon: FontAwesomeIcons.filterList),
                            SizedBox(width: 5.w),
                            BitAppFonts.capt_1_1(
                                value: 'Фильтр', color: bitAppColorBlack),
                            SizedBox(width: 10.w),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CatalogListBuilder(
                      model: catalogListModel,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: _ProductListBuilder(
                        productListModel: productListModel,
                      ),
                    )
                  ],
                ),
              );
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class _ProductListBuilder extends StatelessWidget {
  List<Product> productListModel;
  _ProductListBuilder({
    Key? key,
    required this.productListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: BitAppFonts.capt_1_1(
              value: 'Найдено ${productListModel.length.toString()} товаров',
              color: bitAppColorBlack,
            ),
          ),
        ),
        SizedBox(
          height: 600,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 2 / 2.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            scrollDirection: Axis.vertical,
            itemCount: productListModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  _ProductListElementBuilder(
                    index: index,
                    catalogsList: productListModel,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ProductListElementBuilder extends StatelessWidget {
  final int index;
  final List<Product> catalogsList;
  const _ProductListElementBuilder({
    Key? key,
    required this.index,
    required this.catalogsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = catalogsList[index];
    return GestureDetector(
      onTap: () {},
      child: ProductElementWidget(product: product),
    );
  }
}

class ProductElementWidget extends StatelessWidget {
  const ProductElementWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: bitAppColorWhite,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: sized_box_for_whitespace
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: SizedBox(
                  width: 130,
                  height: 130,
                  child: Center(
                      child: GetImageApi(image: product.previewPicture))),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 32,
              child: BitAppFonts.capt_1_1(
                textAlign: TextAlign.start,
                value: product.name as String,
                color: bitAppColorBlack,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BitAppFonts.body_1_1(
              value: product.price as String,
              color: bitAppColorActiveButton,
            ),
          ),
        ],
      ),
    );
  }
}
