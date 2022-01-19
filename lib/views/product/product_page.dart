import 'package:bitapp/views/catalog/category_arguments_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/core/services/api/product/product_element/product_element_model.dart';
import 'package:bitapp/theme/styles/sized_style.dart';

import 'product_arguments_models.dart';
import 'product_page_model.dart';

class ProductPage extends StatefulWidget {
  final ProductArgument? argument;
  ProductPage({
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
    // catalogListModel.clear();
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
              //
              return Scaffold(
                body: Center(
                  child: ProductBuilder(productElement: productElement),
                ),
              );
            }
        }
      },
    );
  }
}

// ignore: must_be_immutable
class ProductBuilder extends StatelessWidget {
  List<ProductElement> productElement;
  ProductBuilder({
    Key? key,
    required this.productElement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize().h10 * 70,
      child: ListView.builder(
        // cacheExtent: 800,
        scrollDirection: Axis.vertical,
        itemCount: productElement.length,
        itemBuilder: (BuildContext context, int index) {
          final product = productElement[index];
          final sku = productElement[index].skuList![index];
          return Center(
              child: Column(children: [
            Text('${product.name}'),
            Text('${product.country}'),
            Text('${product.detailText}'),
            Text('${sku.skuName}'),
          ]));
        },
      ),
    );
  }
}
