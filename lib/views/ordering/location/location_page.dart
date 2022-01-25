import 'package:bitapp/core/services/api/basket/basket_api_clients.dart';
import 'package:bitapp/core/services/api/basket/basket_model.dart';
import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/catalog/catalog_model.dart';
import 'package:bitapp/views/ordering/location/location_page_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<LocationPage> {
  final textController = TextEditingController();
  late String textData;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LocationPageModel>();

    // final provider = context.watch<LocationPageModel>();
    return Scaffold(
      backgroundColor: AppColor().backgroun,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.check)),
        ],
        leading: IconButton(
            onPressed: () {
              provider.getLocationList(textController.text);
              print('ok');
            },
            icon: Icon(FontAwesomeIcons.trashCanList)),
        title: AppFonts.b14(value: "Корзина", color: AppColor().black),
      ),
      body: Column(
        children: [
          Container(
            // color: AppColor().black,
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: const BorderSide(color: Colors.white),
                      gapPadding: 10.h),
                  prefixIconConstraints:
                      BoxConstraints(minHeight: 0, minWidth: 60.h),
                  suffixIconConstraints:
                      BoxConstraints(minHeight: 0, minWidth: 60.h),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                      borderSide: const BorderSide(color: Colors.white),
                      gapPadding: 10.h),
                ),
              ),
            ),
          ),
          Expanded(
            child:
                Consumer<LocationPageModel>(builder: (context, model, child) {
              return ListView.builder(
                itemCount: model.locationModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var location = model.locationModel[index];
                  return Column(
                    children: [
                      AppFonts.b12(
                          value: location.name, color: AppColor().black),
                    ],
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}

_calcBasketPrice(List<BasketProduct> data) {
  double finalCost = 0;
  data.asMap().forEach((k, v) {
    var price = v.price;
    var quant = v.quantity;
    var costGroup = price! * quant!;
    finalCost += costGroup;
  });
  return finalCost;
}
