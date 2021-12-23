import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/catalog/catalog_page_model.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          _CatalogListBuilder(),
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
  var catalogsList = <Catalog>[];

  Future<void> _futureTest() async {
    final model = context.watch<CatalogModel>();
    catalogsList.clear();
    await model.getCatalog(
        {'SECTION_ID': 'false', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    catalogsList += model.catalogsList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _futureTest(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const SizedBox(
                height: 120, child: Center(child: Text('Loading....')));
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catalogsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _CatalogListElementBuilder(
                      index: index,
                      catalogsList: catalogsList,
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
            CatalogPage();
            Navigator.pushNamed(
              context,
              'home/catalog',
              arguments: catalog.id as String,
            );
          },
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}
