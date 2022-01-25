import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
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
  late String textData;

  @override
  @override
  Widget build(BuildContext context) {
    final provider = context.read<LocationPageModel>();

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
                onChanged: (text) async {
                  EasyDebounce.debounce(
                      'my-debouncer', const Duration(seconds: 1), () {
                    print("Начали");
                    print("Выполнили");
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
                itemCount: model.locationModel.length,
                itemBuilder: (BuildContext context, int index) {
                  var location = model.locationModel[index];
                  return Column(
                    children: [
                      AppFonts.b12(
                          value: location.name, color: AppColor().black),
                      AppFonts.b12(
                          value: location.address, color: AppColor().black),
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

class Debouncer {
  final Duration delay;
  late final Timer timer;

  Debouncer(
    this.delay,
    this.timer,
  );

  call(action) {
    timer.cancel();
    timer = Timer(delay, action);
  }
}

class Debouncer2 {
  Debouncer2({this.delay = const Duration(seconds: 3)});

  final Duration delay;
  Timer? _timer;

  void call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  void dispose() {
    _timer
        ?.cancel(); // You can comment-out this line if you want. I am not sure if this call brings any value.
    _timer = null;
  }
}
