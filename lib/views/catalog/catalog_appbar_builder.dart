import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/theme/styles/button_style.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/views/catalog/category_arguments_models.dart';
import 'package:bitapp/theme/widgets/category/category_list_builder.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CatalogPageAppBarBuilder extends StatelessWidget
    with PreferredSizeWidget {
  List<Category> catalogListModel;
  CategoryArgument argument;
  CatalogPageAppBarBuilder(
      {Key? key, required this.argument, required this.catalogListModel})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(AppSize().h10 * 2);

  @override
  Widget build(BuildContext context) {
    switch (AppSettings.catalogAppbarViewType) {
      case 'horisontal':
        return CatalogNavigationAppbar(
          argument: argument,
          categoryListModel: catalogListModel,
        );
      case 'light':
        return CatalogLightAppbar(
          argument: argument,
        );
      default:
        return CatalogNavigationAppbar(
          argument: argument,
          categoryListModel: catalogListModel,
        );
    }
  }
}

class CatalogNavigationAppbar extends StatelessWidget {
  const CatalogNavigationAppbar({
    Key? key,
    required this.argument,
    required this.categoryListModel,
  }) : super(key: key);

  final CategoryArgument argument;
  final List<Category> categoryListModel;

  @override
  Widget build(BuildContext context) {
    double? value;
    if (categoryListModel.isNotEmpty) {
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
        title: AppText.b20(
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
              child: AppText.b14(value: 'Фильтр', color: AppColor().black),
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
                CategoryListBuilder(categoryListModel: categoryListModel)
                    .catalog(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CatalogLightAppbar extends StatelessWidget {
  const CatalogLightAppbar({
    Key? key,
    required this.argument,
  }) : super(key: key);

  final CategoryArgument argument;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverAppBar(
        centerTitle: false,
        pinned: true,
        title: AppText.b20(
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
              child: AppText.b14(value: 'Фильтр', color: AppColor().black),
              style: ButtonStyleAppBar().textButton,
            ),
          ),
        ],
      ),
    );
  }
}
