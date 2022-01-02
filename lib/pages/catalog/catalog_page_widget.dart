import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/color_style.dart';
import 'package:bitapp/core/theme/widgets/catalog/catalog_element_widget.dart';
import 'package:bitapp/core/theme/styles/button_style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CatalogAppBar extends StatelessWidget {
  const CatalogAppBar({
    Key? key,
    required this.argument,
    required this.catalogListModel,
  }) : super(key: key);

  final Argument argument;
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
                CatalogListBuilder(
                  model: catalogListModel,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
