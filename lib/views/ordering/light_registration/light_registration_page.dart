import 'package:bitapp/theme/widgets/elements/text_field_widget.dart';
import 'package:bitapp/views/ordering/location/location_page.dart';
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
      backgroundColor: AppColor.backgroun,
      appBar: AppBar(
        title:
            AppText.b12(value: "Контактная информация", color: AppColor.black),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                controllerValue: nameController,
                hintString: 'Ваше имя',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppTextField(
                controllerValue: phoneController,
                hintString: 'Номер телефона',
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  await model.postLightRegistration(
                      name: nameController.text, phone: phoneController.text);
                  if (model.type == 'OK') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LocationPage()),
                    );
                  }
                },
                child: AppText.b12(value: 'ПРОДОЛЖИТЬ', color: AppColor.black)),
          ),
        ),
        AppText.b12(value: model.type, color: AppColor.black),
        AppText.b12(value: model.massage, color: AppColor.black),
      ],
    );
  }
}
