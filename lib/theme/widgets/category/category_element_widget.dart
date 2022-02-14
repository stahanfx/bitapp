import 'package:bitapp/core/helper/text_cleaner.dart';
import 'package:bitapp/core/services/api/category/category_model.dart';
import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';

class CategoryElementBuilder {
  final CategoryItem categoryItem;
  const CategoryElementBuilder({
    Key? key,
    required this.categoryItem,
  });

  catalogOneRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppSize.w10, horizontal: AppSize.h10 * 1.5),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSize.w10, horizontal: AppSize.h10 * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.b14(value: categoryItem.name, color: AppColor.black),
                SizedBox(
                    width: AppSize.w10 * 5,
                    height: AppSize.h10 * 5,
                    child: GetImageApi(image: categoryItem.picture)),
              ],
            ),
          )),
    );
  }

  catalogTwoColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize.w10 * 0.5,
      ),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSize.w10,
              horizontal: AppSize.h10,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize.w10 * 5,
                  height: AppSize.h10 * 5,
                  child: GetImageApi(image: categoryItem.picture),
                ),
                SizedBox(
                  height: AppSize.h10 * 0.5,
                ),
                AppText.t12(
                    textAlign: TextAlign.center,
                    value: TextCleaner(
                            baseText: categoryItem.name.toString(),
                            repText: '(OUIFLACON)',
                            newText: '')
                        .base(),
                    color: AppColor.black),
              ],
            ),
          )),
    );
  }
}
