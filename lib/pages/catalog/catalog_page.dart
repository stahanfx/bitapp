import 'package:flutter/material.dart';
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
  final argument;
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
  Future<void> _getLocalModel(argument) async {
    final provider = context.watch<CatalogModel>();

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
    print('Инициализатор CatalogPage запущен');
    return FutureBuilder(
      future: _getLocalModel(widget.argument),
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
                  title: BitAppFonts.head_2(
                      value: 'Категории', color: bitAppColorBlack),
                  actions: [
                    BitAppButtonIcon.appBar(
                        onPressed: () {}, icon: Icons.print),
                    BitAppButtonIcon.appBar(
                        onPressed: () {}, icon: Icons.clear),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _CatalogListBuilder(
                      catalogListModel: catalogListModel,
                    ),
                    _ProductListBuilder(
                      productListModel: productListModel,
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
class _CatalogListBuilder extends StatelessWidget {
  List<Catalog> catalogListModel;
  _CatalogListBuilder({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        cacheExtent: 800,
        scrollDirection: Axis.horizontal,
        itemCount: catalogListModel.length,
        itemBuilder: (BuildContext context, int index) {
          return _CatalogListElementBuilder(
            index: index,
            catalogsList: catalogListModel,
            // catalogList: dataTest,
          );
        },
      ),
    );
  }
}

class _CatalogListElementBuilder extends StatelessWidget {
  final int index;
  final List<Catalog> catalogsList;
  const _CatalogListElementBuilder({
    Key? key,
    required this.index,
    required this.catalogsList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = catalogsList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              'home/catalog',
              arguments: catalog.id,
            );
          },
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}

// ignore: unused_element
class _ProductListBuilder extends StatelessWidget {
  List<Product> productListModel;
  _ProductListBuilder({
    Key? key,
    required this.productListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        scrollDirection: Axis.vertical,
        itemCount: productListModel.length,
        itemBuilder: (BuildContext context, int index) {
          return _ProductListElementBuilder(
            index: index,
            catalogsList: productListModel,
          );
        },
      ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 234,
          child: GestureDetector(
            onTap: () {},
            child: ProductElementWidget(product: product),
          ),
        )
      ],
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
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        Center(
          child: SizedBox(
              height: 150,
              width: 150,
              child: GetImageApi(image: product.previewPicture)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BitAppFonts.capt_1_2(
            textAlign: TextAlign.center,
            value: product.name as String,
            color: bitAppColorBlack,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: BitAppFonts.body_1_1(
            textAlign: TextAlign.center,
            value: product.price as String,
            color: bitAppColorBlack,
          ),
        ),
      ],
    );
  }
}
