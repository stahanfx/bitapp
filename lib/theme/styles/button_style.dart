import 'package:flutter/material.dart';

import 'color_style.dart';
import 'sized_style.dart';

class ButtonStyleAppBar {
  final ButtonStyle textButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColor.white),
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

class AppButtonStuleElevated {
  final ButtonStyle textButton = ElevatedButton.styleFrom(
    primary: AppColor.activeButton,
    elevation: 0,
  );
  final ButtonStyle iconButton = ElevatedButton.styleFrom();
  final ButtonStyle iconTextButton = ElevatedButton.styleFrom();
}
