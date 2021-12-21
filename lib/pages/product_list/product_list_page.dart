import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';

import 'product_list_page_model.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  String? categoryId;
  ProductList({
    Key? key,
    required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerModel = context.watch<ProductListModel>();
    final catalogs = providerModel.catalogsList;
    final products = providerModel.productList;

    if (catalogs.isEmpty) {
      providerModel.getCatalog(
          {'SECTION_ID': '$categoryId', 'IBLOCK_ID': baseTradeCatalog}, '');
    }

    if (products.isEmpty) {
      providerModel.getProduct(
          {'SECTION_ID': '65', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    }

    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      appBar: AppBar(
        title: BitAppFonts.head_2(value: 'Главная', color: bitAppColorBlack),
        actions: [
          BitAppButtonIcon.appBar(
              onPressed: () {
                print(products);
              },
              icon: Icons.print),
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.clear),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120, child: _CatalogScroll(catalogs: catalogs)),
          _ProductGrid(products: products)
        ],
      ),
    );
  }
}

class _CatalogScroll extends StatelessWidget {
  const _CatalogScroll({
    Key? key,
    required this.catalogs,
  }) : super(key: key);

  final List<Catalog> catalogs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: catalogs.length,
          itemBuilder: (BuildContext context, int index) {
            return _PostRowWidget(index: index);
          },
        ),
      ),
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
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
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
    final provider = context.watch<ProductListModel>();
    final productList = provider.productList;
    final product = productList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
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
        )
      ],
    );
  }
}

class _PostRowWidget extends StatelessWidget {
  final int index;
  const _PostRowWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductListModel>();
    final catalogList = provider.catalogsList;
    final catalog = catalogList[index];
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {},
          child: Column(
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: 60.w,
                height: 60.h,
                child: GetImageApi(id: catalog.picture),
              ),
              SizedBox(width: 0.w),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: BitAppFonts.capt_1_2(
                  textAlign: TextAlign.center,
                  value: catalog.name as String,
                  color: bitAppColorBlack,
                ),
              ),
              SizedBox(width: 100.h),
            ],
          ),
        )
      ],
    );
  }
}
