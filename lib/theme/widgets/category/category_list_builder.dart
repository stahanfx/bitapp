import 'package:bitapp/core/services/api/category/category_model.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/core/base/global_parametrs.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import '../../../views/catalog/category_arguments_models.dart';
import 'category_element_widget.dart';

class CategoryListBuilder {
  List<CategoryItem> categoryListModel;
  CategoryListBuilder({
    Key? key,
    required this.categoryListModel,
  });

  home() {
    if (categoryListModel.isNotEmpty) {
      switch (AppGlobalSettings.homeCategoryViewType) {
        case 'verticaltext':
          return CategoryListVerticalText(categoryListModel: categoryListModel);
      }
    } else {
      return Container();
    }
  }

  catalog() {
    if (categoryListModel.isNotEmpty) {
      switch (AppGlobalSettings.catalogCategiryViewType) {
        case 'verticalTwoText':
          return CategoryListTwoVerticalText(
              categoryListModel: categoryListModel);
      }
    } else {
      return Container();
    }
  }
}

// ignore: must_be_immutable
class CategoryListVerticalText extends StatelessWidget {
  List<CategoryItem> categoryListModel;
  CategoryListVerticalText({
    Key? key,
    required this.categoryListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize().h10 * 70,
      child: ListView.builder(
        // cacheExtent: 800,
        scrollDirection: Axis.vertical,
        itemCount: categoryListModel.length,
        itemBuilder: (BuildContext context, int index) {
          final categoryItem = categoryListModel[index];
          return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'catalog',
                    arguments:
                        CategoryArgument(categoryItem.name, categoryItem.id));
              },
              child: CategoryElementBuilder(categoryItem: categoryItem)
                  .catalogOneRow());
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryListTwoVerticalText extends StatelessWidget {
  List<CategoryItem> categoryListModel;
  CategoryListTwoVerticalText({
    Key? key,
    required this.categoryListModel,
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
          itemCount: categoryListModel.length,
          itemBuilder: (BuildContext context, int index) {
            final categoryItem = categoryListModel[index];
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'catalog',
                      arguments:
                          CategoryArgument(categoryItem.name, categoryItem.id));
                },
                child: CategoryElementBuilder(categoryItem: categoryItem)
                    .catalogTwoColumn());
          },
        ),
      ),
    );
  }
}
