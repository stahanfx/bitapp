import 'package:bitapp/core/helper/text_clean.dart';
import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

class CatalogElementWidget extends StatelessWidget {
  final Catalog catalog;
  const CatalogElementWidget({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          SizedBox(
            width: AppSize().w10 * 6,
            height: AppSize().h10 * 6,
            child: GetImageApi(image: catalog.picture),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppSize().h10 * 0.5,
            ),
            child: SizedBox(
              width: AppSize().w10 * 8,
              height: AppSize().h10 * 2,
              child: AppFonts.t10(
                textAlign: TextAlign.center,
                value: TextCleaner(
                  baseText: catalog.name.toString(),
                  repText: '(OUIFLACON)',
                  newText: '',
                ).base(),
                color: AppColor().black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CatalogHomeElementWidget extends StatelessWidget {
  final Catalog catalog;
  const CatalogHomeElementWidget({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Container(
        color: AppColor().white,
        child: Column(
          children: [
            SizedBox(
              width: AppSize().w10 * 6,
              height: AppSize().h10 * 6,
              child: GetImageApi(image: catalog.picture),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppSize().h10 * 0.5,
              ),
              child: SizedBox(
                width: AppSize().w10 * 8,
                height: AppSize().h10 * 2,
                child: AppFonts.t10(
                  textAlign: TextAlign.center,
                  value: TextCleaner(
                    baseText: catalog.name.toString(),
                    repText: '(OUIFLACON)',
                    newText: '',
                  ).base(),
                  color: AppColor().black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
