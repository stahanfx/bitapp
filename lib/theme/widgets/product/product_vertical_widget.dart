import 'package:bitapp/core/helper/text_clean.dart';
import 'package:bitapp/core/services/api/file/image_services.dart';
import 'package:bitapp/core/services/api/product/product_list/product_list_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/theme/styles/sized_style.dart';
import 'package:bitapp/views/product/product_arguments_models.dart';
import 'package:flutter/material.dart';

class ProductGridBuilder extends StatelessWidget {
  final List<ProductList> productListModel;
  const ProductGridBuilder({
    Key? key,
    required this.productListModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: AppSize().h10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: AppSize().w10 * 20,
          mainAxisSpacing: AppSize().w10,
          crossAxisSpacing: AppSize().w10,
          childAspectRatio: 0.743,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final product = productListModel[index];
            return GestureDetector(
              onTap: () {},
              child: ProductElementWidget(product: product),
            );
          },
          childCount: productListModel.length,
        ),
      ),
    );
  }
}

class ProductElementWidget extends StatelessWidget {
  const ProductElementWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductList product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'catalog/product',
            arguments: ProductArgument(product.id));
      },
      child: Container(
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
                  AppSize().w10, AppSize().h10, AppSize().w10, AppSize().h10),
              child: AppFonts.b12(
                value: product.price,
                color: AppColor().activeButton,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  AppSize().w10, AppSize().h10, AppSize().w10, AppSize().h10),
              child: SizedBox(
                height: AppSize().h10 * 3,
                child: AppFonts.b12(
                  textAlign: TextAlign.start,
                  value: TextCleaner(
                    baseText: product.name.toString(),
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
