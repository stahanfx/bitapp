import 'package:flutter/material.dart';

import 'color_style.dart';
import 'sized_style.dart';

class ButtonStyleAppBar {
  static final ButtonStyle textButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(AppColor.white),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppSize.r10 * 1.6,
        ),
        // side: BorderSide(color: Colors.red),
      ),
    ),
  );

  static final ButtonStyle iconButton = ElevatedButton.styleFrom();
  static final ButtonStyle iconTextButton = ElevatedButton.styleFrom();
}

class AppButtonStuleElevated {
  static final ButtonStyle textButton = ElevatedButton.styleFrom(
    primary: AppColor.activeButton,
    elevation: 0,
  );
  static final ButtonStyle iconButton = ElevatedButton.styleFrom();
  static final ButtonStyle iconTextButton = ElevatedButton.styleFrom();
}
