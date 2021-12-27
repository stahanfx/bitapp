import 'package:flutter/material.dart';
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
  Future<void> _getLocalModel(argument) async {
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
    Argument arg = widget.argument as Argument;
    return FutureBuilder(
      future: _getLocalModel(arg.id),
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
                      value: '${arg.title}', color: bitAppColorBlack),
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
                  // BitAppButtonIcon.appBar(
                  //   onPressed: () => Navigator.of(context).pop(),
                  //   icon: FontAwesomeIcons.chevronLeft,
                  // ),
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
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: bitAppColorWhite,
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5),
                            // BitAppButtonIcon.appBar(
                            //     onPressed: () {},
                            //     icon: FontAwesomeIcons.filterList),
                            SizedBox(width: 5),
                            BitAppFonts.capt_1_1(
                                value: 'Фильтр', color: bitAppColorBlack),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CatalogListBuilder(
                      model: catalogListModel,
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

// Route _createRoute(catalog) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) =>
//         CatalogPage(argument: catalog),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(0.0, 1.0);
//       const end = Offset.zero;
//       final tween = Tween(begin: begin, end: end);
//       final offsetAnimation = animation.drive(tween);

//       return SlideTransition(
//         position: offsetAnimation,
//         child: child,
//       );
//     },
//   );
// }

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
      height: 600,
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
