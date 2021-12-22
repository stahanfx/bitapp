import 'package:bitapp/core/services/api/api_path.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:bitapp/core/theme/widgets/buttons_widgets.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:bitapp/pages/catalog/catalog_page.dart';
import 'package:bitapp/pages/catalog/catalog_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: implementation_imports
import 'package:provider/src/provider.dart';

import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomePageModel>();
    final catalogs = provider.catalogsList;

    if (provider.catalogsList.isEmpty) {
      provider.getCatalog(
          {'SECTION_ID': 'false', 'IBLOCK_ID': baseTradeCatalog}, 'light');
    }

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
        children: [
          _CatalogListBuilder(catalogs: catalogs),
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
    final provider = context.watch<HomePageModel>();
    final catalogList = provider.catalogsList;
    final catalog = catalogList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'home/catalog',
              arguments: catalog.id),
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}
