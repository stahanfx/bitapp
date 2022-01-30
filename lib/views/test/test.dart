import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:bitapp/views/test/test_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<TestModel>();
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<TestModel>(
        builder: (context, model, child) {
          return Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    model.getModel();
                  },
                  child: AppText.t14(value: "GetData", color: AppColor.black),
                ),
                AppText.b12(
                    value: provider.model.toString(), color: AppColor.black),
              ],
            ),
          );
        },
      ),
    );
  }
}
