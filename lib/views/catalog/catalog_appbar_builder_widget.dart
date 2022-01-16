import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/theme/styles/button_style.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/widgets/catalog/catalog_arguments_models.dart';
import 'package:bitapp/theme/widgets/catalog/catalog_list_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

catalogAppBarBuilder(argument, catalogListModel) {
  switch (AppSettings.categoryViewTupe) {
    case 'horisontal':
      return CatalogNavigationAppbar(
        argument: argument,
        catalogListModel: catalogListModel,
      );
    case 'vertical':
      return CatalogLightApppbar(
        argument: argument,
      );
    default:
      return CatalogNavigationAppbar(
        argument: argument,
        catalogListModel: catalogListModel,
      );
  }
}

class CatalogNavigationAppbar extends StatelessWidget {
  const CatalogNavigationAppbar({
    Key? key,
    required this.argument,
    required this.catalogListModel,
  }) : super(key: key);

  final ArgumentCatalogBase argument;
  final List<Catalog> catalogListModel;

  @override
  Widget build(BuildContext context) {
    double? value;
    if (catalogListModel.isNotEmpty) {
      value = 130;
    } else {
      value = 0;
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverAppBar(
        centerTitle: false,
        // floating: true,
        pinned: true,
        expandedHeight: value,
        title: AppFonts.b20(
          value: '${argument.title}',
          color: AppColor().black,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 5,
            top: 10,
            bottom: 10,
          ),
          child: CircleAvatar(
            backgroundColor: AppColor().white,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: AppColor().black,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
              top: 10,
              bottom: 10,
            ),
            child: CircleAvatar(
              backgroundColor: AppColor().white,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColor().black,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: AppFonts.b14(value: 'Фильтр', color: AppColor().black),
              style: ButtonStyleAppBar().textButton,
            ),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                catalogListBuilder(catalogListModel),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatalogLightApppbar extends StatelessWidget {
  const CatalogLightApppbar({
    Key? key,
    required this.argument,
  }) : super(key: key);

  final ArgumentCatalogBase argument;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverAppBar(
        centerTitle: false,
        pinned: true,
        title: AppFonts.b20(
          value: '${argument.title}',
          color: AppColor().black,
        ),
        leading: Padding(
          padding: const EdgeInsets.only(
            right: 5,
            top: 10,
            bottom: 10,
          ),
          child: CircleAvatar(
            backgroundColor: AppColor().white,
            child: IconButton(
              icon: Icon(
                FontAwesomeIcons.arrowLeft,
                color: AppColor().black,
                size: 20,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
              top: 10,
              bottom: 10,
            ),
            child: CircleAvatar(
              backgroundColor: AppColor().white,
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  color: AppColor().black,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: AppFonts.b14(value: 'Фильтр', color: AppColor().black),
              style: ButtonStyleAppBar().textButton,
            ),
          ),
        ],
      ),
    );
  }
}
