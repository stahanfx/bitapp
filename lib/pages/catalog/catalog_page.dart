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
  final argument;
  CatalogPage({
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

//Обьявляем методы
// - Методы локальной модели
  Future<void> _getLocalModel(argument) async {
    final model = context.watch<CatalogModel>();
    catalogListModel.clear();
    final catalogListData = await model.getCatalog(
        {'SECTION_ID': '$argument', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    if (catalogListData != null) {
      catalogListModel += catalogListData;
    }
  }

//Методы глобальной модели

  @override
  Widget build(BuildContext context) {
    print('Инициализатор CatalogPage запущен');
    return FutureBuilder(
      future: _getLocalModel(widget.argument),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          // return Center(child: Text('Loading....'));
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
                  ],
                ),
              );
            }
        }
      },
    );
  }
}

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
class _ProductGrid extends StatelessWidget {
  const _ProductGrid({
    Key? key,
    required this.products,
  }) : super(key: key);

  final List<Product> products;

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
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return _ProductGridWidget(index: index);
        },
      ),
    );
  }
}

class _ProductGridWidget extends StatelessWidget {
  final int index;
  const _ProductGridWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CatalogModel>();
    final productList = provider.productList;
    final product = productList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 234,
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                // ignore: sized_box_for_whitespace
                GetImageApi(id: product.previewPicture),
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
            ),
          ),
        )
      ],
    );
  }
}
