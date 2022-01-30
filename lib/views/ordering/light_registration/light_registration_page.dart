import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';

import 'light_registration_model.dart';

class LightRegistrationPage extends StatelessWidget {
  const LightRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: AppText.b12(value: "value", color: AppColor.black),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: nameController,
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
            TextField(
              keyboardType: TextInputType.text,
              controller: phoneController,
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
            Consumer<LightRegistrationPageModel>(
                builder: (context, model, child) {
              return _LightRegistrationWidget(
                nameController: nameController,
                phoneController: phoneController,
                model: model,
              );
            }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _LightRegistrationWidget extends StatelessWidget {
  LightRegistrationPageModel model;

  _LightRegistrationWidget({
    Key? key,
    required this.model,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () async {
              print('object');
              await model.postLightRegistration(
                  name: nameController.text, phone: phoneController.text);
              if (model.type == 'OK') {
                Navigator.pushNamed(context, 'basket/lightRegister/location');
              }
            },
            child: AppText.b12(value: 'value123', color: AppColor.black)),
        AppText.b12(value: model.type, color: AppColor.black),
        AppText.b12(value: model.massage, color: AppColor.black),
      ],
    );
  }
}
