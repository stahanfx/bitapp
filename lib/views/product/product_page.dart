import 'package:bitapp/core/services/file/image_services.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bitapp/core/services/api/product/product_element/product_element_model.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import 'product_arguments_models.dart';
import 'product_page_model.dart';

class ProductPage extends StatefulWidget {
  final ProductArgument? argument;
  const ProductPage({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _HomePageState();
}

class _HomePageState extends State<ProductPage> {
  List<ProductElement> productElement = [];

  Future<void> _getModel(argument) async {
    final model = context.watch<ProductPageModel>();
    productElement.clear();
    final categoryListData = await model.getProductElement(argument);
    productElement += categoryListData;
  }

  @override
  Widget build(BuildContext context) {
    ProductArgument argument = widget.argument as ProductArgument;

    return FutureBuilder(
      future: _getModel(argument.id),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: Text('Loading....'));
          default:
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('Error: ${snapshot.error}')),
              );
            } else {
              return ProductBuilder(productElement: productElement.first);
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ProductBuilder extends StatelessWidget {
  ProductElement productElement;
  ProductBuilder({
    Key? key,
    required this.productElement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            actions: [
              IconButton(
                icon: const Icon(
                  FontAwesomeIcons.heart,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'product');
                },
              ),
            ],
            pinned: false,
            snap: false,
            floating: false,
            expandedHeight: 320.0,
            flexibleSpace: FlexibleSpaceBar(
              // title: AppFonts.t12(
              //     value: productElement.name, color: AppColor().black),
              background: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: AppSize().h10 * 4, bottom: AppSize().h10 * 2),
                  child: GetImageApi(image: productElement.detailPicture),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppSize().w10, horizontal: AppSize().w10),
              child: Center(
                child: AppFonts.b16(
                    value: productElement.name, color: AppColor().black),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SizedBox(
                  // color: index.isOdd ? Colors.white : Colors.black12,
                  height: 80.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: productElement.skuList?.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: AppSize().w10, horizontal: AppSize().w10),
              child: AppFonts.t14(
                  value: productElement.detailText, color: AppColor().black),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8),
      //     child: OverflowBar(
      //       overflowAlignment: OverflowBarAlignment.center,
      //       children: <Widget>[
      //         Container(
      //           color: Colors.amber,
      //           height: 60,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
