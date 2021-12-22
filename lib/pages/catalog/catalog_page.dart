import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';

import 'catalog_page_model.dart';

// ignore: must_be_immutable
class CatalogPage extends StatelessWidget {
  const CatalogPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<CatalogModel>();
    final catalogs = model.catalogsList;
    final products = model.productList;

    final arguments = ModalRoute.of(context)!.settings.arguments;

    if (catalogs.isEmpty) {
      model.getCatalog(
          {'SECTION_ID': '$arguments', 'IBLOCK_ID': baseTradeCatalog}, '');
    }

    if (products.isEmpty) {
      model.getProduct(
          {'SECTION_ID': '65', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    }
    final List<Catalog> list = catalogs;
    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      appBar: AppBar(
        title: BitAppFonts.head_2(value: 'Главная', color: bitAppColorBlack),
        actions: [
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.print),
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.clear),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CatalogListBuilder(catalogs: catalogs),
          _ProductGrid(products: products),
        ],
      ),
    );
  }
}

class _CatalogListBuilder extends StatelessWidget {
  const _CatalogListBuilder({
    Key? key,
    required this.catalogs,
  }) : super(key: key);

  final List<Catalog> catalogs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catalogs.length,
        itemBuilder: (BuildContext context, int index) {
          return _CatalogListElementBuilder(index: index);
        },
      ),
    );
  }
}

class _CatalogListElementBuilder extends StatelessWidget {
  final int index;
  const _CatalogListElementBuilder({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<CatalogModel>();
    final catalogList = provider.catalogsList;
    final catalog = catalogList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            'home/catalog',
            arguments: catalog,
          ),
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}

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
