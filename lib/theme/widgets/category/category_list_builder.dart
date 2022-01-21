import 'package:flutter/material.dart';

import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import '../../../views/catalog/category_arguments_models.dart';
import 'category_element_widget.dart';

class CategoryListBuilder {
  List<Category> categoryListModel;
  CategoryListBuilder({
    Key? key,
    required this.categoryListModel,
  });

  home() {
    if (categoryListModel.isNotEmpty) {
      switch (AppSettings.homeCategoryViewType) {
        case 'verticaltext':
          return CategoryListVerticalText(catalogListModel: categoryListModel);
      }
    } else {
      return Container();
    }
  }

  catalog() {
    if (categoryListModel.isNotEmpty) {
      switch (AppSettings.catalogCategiryViewType) {
        case 'verticalTwoText':
          return CategoryListTwoVerticalText(
              catalogListModel: categoryListModel);
      }
    } else {
      return Container();
    }
  }
}

// ignore: must_be_immutable
class CategoryListVerticalText extends StatelessWidget {
  List<Category> catalogListModel;
  CategoryListVerticalText({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize().h10 * 70,
      child: ListView.builder(
        // cacheExtent: 800,
        scrollDirection: Axis.vertical,
        itemCount: catalogListModel.length,
        itemBuilder: (BuildContext context, int index) {
          final catalog = catalogListModel[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'catalog',
                    arguments: CategoryArgument(catalog.name, catalog.id));
              },
              child: CategoryElementBuilder(catalog: catalog).catalogOneRow());
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryListTwoVerticalText extends StatelessWidget {
  List<Category> catalogListModel;
  CategoryListTwoVerticalText({
    Key? key,
    required this.catalogListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize().h10,
      ),
      child: SizedBox(
        height: AppSize().h10 * 80,
        child: GridView.builder(
          padding: EdgeInsets.only(top: 0, bottom: AppSize().h10 * 18),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize().w10 * 20,
            // mainAxisSpacing: AppSize().w10 * 0.1,
            crossAxisSpacing: AppSize().w10,
            childAspectRatio: 1.5,
          ),
          // cacheExtent: 800,
          scrollDirection: Axis.vertical,
          itemCount: catalogListModel.length,
          itemBuilder: (BuildContext context, int index) {
            final catalog = catalogListModel[index];
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'catalog',
                      arguments: CategoryArgument(catalog.name, catalog.id));
                },
                child: CategoryElementBuilder(catalog: catalog)
                    .catalogTwoColumn());
          },
        ),
      ),
    );
  }
}
