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
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bitAppColorBackgroun,
      appBar: AppBar(
        title: BitAppFonts.head_2(value: 'Главная', color: bitAppColorBlack),
        actions: [
          BitAppButtonIcon.appBar(onPressed: () {}, icon: Icons.print),
          BitAppButtonIcon.appBar(
              onPressed: () {
                // model.clearCatalog();
              },
              icon: Icons.clear),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _CatalogListBuilder(),
          // _ProductGrid(products: products),
        ],
      ),
    );
  }
}

class _CatalogListBuilder extends StatefulWidget {
  const _CatalogListBuilder({
    Key? key,
    // required this.catalogs,
  }) : super(key: key);
  @override
  State<_CatalogListBuilder> createState() => _CatalogListBuilderState();
}

class _CatalogListBuilderState extends State<_CatalogListBuilder> {
  Future<List<Catalog>> _futureTest(arguments) async {
    final model = context.watch<CatalogModel>();
    await model.clearCatalog();
    await model.getCatalog(
        {'SECTION_ID': arguments, 'IBLOCK_ID': baseTradeCatalog}, 'light');
    List<Catalog> catalogs = model.catalogsList;
    return catalogs;
  }

  @override
  Widget build(BuildContext context) {
    final String arguments =
        ModalRoute.of(context)!.settings.arguments.toString();
    return FutureBuilder(
      future: _futureTest(arguments),
      builder: (BuildContext context, AsyncSnapshot<List<Catalog>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const SizedBox(
                height: 120, child: Center(child: Text('Loading....')));
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Catalog> dataTest = snapshot.data!;
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataTest.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _CatalogListElementBuilder(
                      index: index,
                      // catalogList: dataTest,
                    );
                  },
                ),
              );
            }
        }
      },
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
