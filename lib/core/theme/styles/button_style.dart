import 'package:bitapp/core/theme/styles/color_style.dart';
import 'package:bitapp/core/theme/styles/sized_style.dart';
import 'package:flutter/material.dart';

class ButtonStyleAppBar {
  final ButtonStyle textButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColor().white),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize().r10 * 1.6,
        ),
        // side: BorderSide(color: Colors.red),
      ),
    ),
  );

  final ButtonStyle iconButton = ElevatedButton.styleFrom();
  final ButtonStyle iconTextButton = ElevatedButton.styleFrom();
}

class ButtonStyleContent {
  final ButtonStyle textButton = ElevatedButton.styleFrom();
  final ButtonStyle iconButton = ElevatedButton.styleFrom();
  final ButtonStyle iconTextButton = ElevatedButton.styleFrom();
}
