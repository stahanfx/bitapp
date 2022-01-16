import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/views/catalog/category_arguments_models.dart';

import 'package:bitapp/theme/widgets/category/category_list_builder.dart';
import 'package:bitapp/theme/widgets/product/product_vertical_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/api/product/product_model.dart';

import 'catalog_model.dart';
import 'catalog_appbar_builder.dart';

class CatalogPage extends StatefulWidget {
  final CategoryArgument? argument;
  const CatalogPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  var catalogListModel = <Category>[];
  var productListModel = <Product>[];

  Future<void> _getModels(argument) async {
    final provider = context.read<CatalogPageModel>();

    //Текущий уровень каталога
    final catalogListData = await provider.getCatalog({
      'SECTION_ID': '$argument',
      'IBLOCK_ID': AppSettings.baseTradeCatalog,
      'ACTIVE': 'Y',
    }, 'light');
    if (catalogListData != null) {
      catalogListModel += catalogListData;
    }

    switch (AppSettings.categoryAllChildrenProduct) {
      case 'Y':
        final productListData = await provider.getProduct({
          'SECTION_ID': '$argument',
          'IBLOCK_ID': AppSettings.baseTradeCatalog,
          'CATALOG_AVAILABLE': 'Y',
        }, 'light');
        if (productListData != null) {
          productListModel += productListData;
        }
        for (var element in catalogListModel) {
          final productListData = await provider.getProduct({
            'SECTION_ID': '${element.id}',
            'IBLOCK_ID': AppSettings.baseTradeCatalog
          }, 'light');
          if (productListData != null) {
            productListModel += productListData;
          }
        }
        break;

      case 'N':
        final productListData = await provider.getProduct({
          'SECTION_ID': '$argument',
          'IBLOCK_ID': AppSettings.baseTradeCatalog,
          'CATALOG_AVAILABLE': 'Y',
        }, 'light');
        if (productListData != null) {
          productListModel += productListData;
        }
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    CategoryArgument argument = widget.argument as CategoryArgument;

    return FutureBuilder(
      future: _getModels(argument.id),
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
                    CatalogPageAppBarBuilder(
                        argument: argument, catalogListModel: catalogListModel),
                    SliverToBoxAdapter(
                      child: CategoryListBuilder(
                        categoryListModel: catalogListModel,
                      ).catalog(),
                    ),
                    ProductGridBuilder(
                      productListModel: productListModel,
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
