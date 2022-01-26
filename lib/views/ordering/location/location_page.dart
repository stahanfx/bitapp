import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/ordering/location/location_page_model.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _BasketPageState createState() => _BasketPageState();
}

class _BasketPageState extends State<LocationPage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<LocationPageModel>();
    provider.getLocationList('');

    // final provider = context.watch<LocationPageModel>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor().backgroun,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.check)),
        ],
        leading: IconButton(
            onPressed: () async {}, icon: Icon(FontAwesomeIcons.trashCanList)),
        title: AppFonts.b14(value: "Корзина", color: AppColor().black),
      ),
      body: Column(
        children: [
          Container(
            // color: AppColor().black,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.text,
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
                onChanged: (text) async {
                  EasyDebounce.debounce(
                      'getLocationList', const Duration(seconds: 1), () {
                    provider.getLocationList(textController.text);
                  });
                },
              ),
            ),
          ),
          Expanded(
            child:
                Consumer<LocationPageModel>(builder: (context, model, child) {
              return ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: model.locationModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var location = model.locationModel[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 1),
                    child: Container(
                      color: AppColor().white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppFonts.b12(
                                value: location.name, color: AppColor().black),
                            AppFonts.t12(
                                value: location.address,
                                color: AppColor().black),
                          ],
                        ),
                      ),
                    ),
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
