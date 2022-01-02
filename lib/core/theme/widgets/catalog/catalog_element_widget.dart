import 'package:bitapp/core/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/color_style.dart';

// ignore: must_be_immutable
class CatalogListBuilder extends StatelessWidget {
  List<Catalog> model;
  CatalogListBuilder({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (model.isNotEmpty) {
      return SizedBox(
        height: 66,
        child: ListView.builder(
          cacheExtent: 800,
          scrollDirection: Axis.horizontal,
          itemCount: model.length,
          itemBuilder: (BuildContext context, int index) {
            return _CatalogListElementBuilder(
              index: index,
              model: model,
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
  final List<Catalog> model;
  const _CatalogListElementBuilder({
    Key? key,
    required this.index,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = model[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'home/catalog',
                arguments: Argument(catalog.name, catalog.id));
          },
          child: CatalogElementWidget(catalog: catalog),
        ),
      ],
    );
  }
}

class Argument {
  String? title;
  String? id;

  Argument(
    this.title,
    this.id,
  );
}

class CatalogElementWidget extends StatelessWidget {
  final Catalog catalog;
  const CatalogElementWidget({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: AppSize().w10 * 4,
          height: AppSize().h10 * 4,
          child: GetImageApi(image: catalog.picture),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: AppSize().h10 * 0.6,
          ),
          child: SizedBox(
            width: AppSize().w10 * 6,
            height: AppSize().h10 * 2,
            child: AppFonts.t8(
              textAlign: TextAlign.center,
              value: catalog.name as String,
              color: AppColor().black,
            ),
          ),
        ),
      ],
    );
  }
}
