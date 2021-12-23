import 'package:bitapp/core/services/api/catalog/catalog_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
import 'package:flutter/material.dart';

class CatalogElementWidget extends StatelessWidget {
  final Catalog catalog;
  const CatalogElementWidget({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          // ignore: sized_box_for_whitespace
          Container(
            width: 40,
            height: 40,
            // color: Colors.red,
            child: GetImageApi(id: catalog.picture),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: SizedBox(
              width: 60,
              height: 24,
              // color: Colors.red,
              child: BitAppFonts.capt_1_2(
                textAlign: TextAlign.center,
                value: catalog.name as String,
                color: bitAppColorBlack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
