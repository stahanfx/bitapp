import 'package:bitapp/core/services/api/global_parametrs.dart';
import 'package:bitapp/core/theme/styles/sized_style.dart';
import 'package:bitapp/core/theme/widgets/catalog/product_element_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:bitapp/core/theme/styles/color_style.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';

import 'catalog_page_model.dart';
import 'catalog_page_widget.dart';

class CatalogPage extends StatefulWidget {
  final Argument? argument;
  const CatalogPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  var catalogListModel = <Catalog>[];
  var productListModel = <Product>[];

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
            return Center(
              child: SizedBox(
                height: AppSize().h10 * 3,
                width: AppSize().w10 * 3,
                child: const CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Scaffold(
                backgroundColor: AppColor().backgroun,
                body: CustomScrollView(
                  slivers: [
                    CatalogAppBar(
                        argument: argument, catalogListModel: catalogListModel),
                    _ProductBuilder(productListModel: productListModel),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: AppSize().h10 * 9,
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

class _ProductBuilder extends StatelessWidget {
  final List<Product> productListModel;
  const _ProductBuilder({
    Key? key,
    required this.productListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSize().h10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: AppSize().w10 * 20,
          mainAxisSpacing: AppSize().w10,
          crossAxisSpacing: AppSize().w10,
          childAspectRatio: 0.743,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final product = productListModel[index];
            return GestureDetector(
              onTap: () {},
              child: ProductElementWidget(product: product),
            );
          },
          childCount: productListModel.length,
        ),
      ),
    );
  }
}
