import 'package:bitapp/core/services/api/product/product_model.dart';
import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/color_style.dart';
import 'package:bitapp/core/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

class ProductElementWidget extends StatelessWidget {
  const ProductElementWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize().r10 * 1.6),
        color: AppColor().white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: AppSize().r10 / 10,
            blurRadius: AppSize().r10 / 10,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ignore: sized_box_for_whitespace
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: AppSize().h10),
              child: SizedBox(
                  width: AppSize().w10 * 13,
                  height: AppSize().h10 * 13,
                  child: Center(
                      child: GetImageApi(image: product.previewPicture))),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSize().w10,
              AppSize().h10,
              AppSize().w10,
              AppSize().h10,
            ),
            child: AppFonts.b12(
              value: product.price as String,
              color: AppColor().activeButton,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppSize().w10,
              AppSize().h10,
              AppSize().w10,
              AppSize().h10,
            ),
            child: SizedBox(
              height: AppSize().h10 * 3,
              child: AppFonts.b12(
                textAlign: TextAlign.start,
                value: product.name as String,
                color: AppColor().black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
