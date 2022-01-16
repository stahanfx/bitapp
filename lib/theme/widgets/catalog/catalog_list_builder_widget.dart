import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import 'catalog_arguments_models.dart';
import 'catalog_element_widget.dart';

catalogListBuilder(catalogListModel) {
  switch (AppSettings.categoryHomeViewTupe) {
    case 'vertical':
      return CatalogVerticalListBuilder(catalogListModel: catalogListModel);
    case 'horisontal':
      return CatalogHorisontalListBuilder(catalogListModel: catalogListModel);
    default:
      return CatalogHorisontalListBuilder(catalogListModel: catalogListModel);
  }
}

// ignore: must_be_immutable
class CatalogVerticalListBuilder extends StatelessWidget {
  List<Catalog> catalogListModel;
  CatalogVerticalListBuilder({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (catalogListModel.isNotEmpty) {
      return SizedBox(
        height: AppSize().h10 * 70,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize().w10 * 10,
            mainAxisSpacing: AppSize().w10,
            crossAxisSpacing: AppSize().w10,
            childAspectRatio: 0.7,
          ),
          cacheExtent: 800,
          scrollDirection: Axis.vertical,
          itemCount: catalogListModel.length,
          itemBuilder: (BuildContext context, int index) {
            return _CatalogListElementBuilder(
              index: index,
              catalogList: catalogListModel,
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}

// ignore: must_be_immutable
class CatalogHorisontalListBuilder extends StatelessWidget {
  List<Catalog> catalogListModel;
  CatalogHorisontalListBuilder({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (catalogListModel.isNotEmpty) {
      return SizedBox(
        height: AppSize().h10 * 11,
        child: ListView.builder(
          cacheExtent: 800,
          scrollDirection: Axis.horizontal,
          itemCount: catalogListModel.length,
          itemBuilder: (BuildContext context, int index) {
            return _CatalogListElementBuilder(
              index: index,
              catalogList: catalogListModel,
            );
          },
        ),
      );
    } else {
      return Container();
    }
  }
}

class _CatalogListElementBuilder extends StatelessWidget {
  final int index;
  final List<Catalog> catalogList;
  const _CatalogListElementBuilder({
    Key? key,
    required this.index,
    required this.catalogList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = catalogList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home/catalog',
                arguments: ArgumentCatalogBase(catalog.name, catalog.id));
          },
          child: CatalogHomeElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}
