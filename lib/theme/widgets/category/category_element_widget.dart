import 'package:bitapp/core/helper/text_clean.dart';
import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';

class CategoryElementBuilder {
  final Category catalog;
  const CategoryElementBuilder({
    Key? key,
    required this.catalog,
  });

  catalogOneRow() {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: AppSize().w10, horizontal: AppSize().h10 * 1.5),
      child: Container(
          color: AppColor().white,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: AppSize().w10, horizontal: AppSize().h10 * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppFonts.b14(value: catalog.name, color: AppColor().black),
                SizedBox(
                    width: AppSize().w10 * 5,
                    height: AppSize().h10 * 5,
                    child: GetImageApi(image: catalog.picture)),
              ],
            ),
          )),
    );
  }

  catalogTwoColumn() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSize().w10 * 0.5,
      ),
      child: Container(
          color: AppColor().white,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSize().w10,
              horizontal: AppSize().h10,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: AppSize().w10 * 5,
                  height: AppSize().h10 * 5,
                  child: GetImageApi(image: catalog.picture),
                ),
                SizedBox(
                  height: AppSize().h10 * 0.5,
                ),
                AppFonts.t12(
                    textAlign: TextAlign.center,
                    value: TextCleaner(
                            baseText: catalog.name.toString(),
                            repText: '(OUIFLACON)',
                            newText: '')
                        .base(),
                    color: AppColor().black),
              ],
            ),
          )),
    );
  }
}
