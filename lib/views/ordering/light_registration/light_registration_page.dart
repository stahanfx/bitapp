import 'package:bitapp/theme/styles/color_style.dart';
import 'package:bitapp/theme/styles/font_style.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'light_registration_model.dart';

class LightRegistrationPage extends StatelessWidget {
  LightRegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final provider = context.read<LightRegistrationPageModel>();
    return Scaffold(
      appBar: AppBar(),
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
                return Column(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          await model.postLightRegistration(
                              name: nameController.text,
                              phone: phoneController.text);
                        },
                        child: AppText.b12(
                            value: 'value', color: AppColor().black)),
                    AppText.b12(value: model.type, color: AppColor().black),
                    AppText.b12(value: model.massage, color: AppColor().black),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
