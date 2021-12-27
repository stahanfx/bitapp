import 'package:bitapp/core/theme/styles/font_style.dart';
import 'package:bitapp/core/theme/styles/global_style.dart';
// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BitAppButtons extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final Color backgroundColor;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final double borderRadius;
  final Color salBackColor;
  final Color textColor;
  final double fontSize;

  // ignore: non_constant_identifier_names
  const BitAppButtons.standart_active({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.left = 10,
    this.top = 18,
    this.right = 10,
    this.bottom = 18,
    this.borderRadius = 20,
    this.salBackColor = Colors.white,
    this.textColor = Colors.white,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                  EdgeInsets.fromLTRB(left.w, top.h, right.w, bottom.h)),
              shadowColor: MaterialStateProperty.all(const Color(0x006D5AE6)),
              backgroundColor: MaterialStateProperty.all(backgroundColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius.r),
                    side: BorderSide(color: salBackColor, width: 1.r)),
              ),
            ),
            onPressed: onPressed,
            child: BitAppFonts.head_2(value: text.tr(), color: bitAppColorWhite)

            // Text(
            //   text.tr(),
            //   style: TextStyle(color: textColor, fontSize: fontSize),
            // ),
            ));
  }
}

// ignore: must_be_immutable
class BitAppButtonIcon extends StatelessWidget {
  late VoidCallback onPressed;
  late IconData icon;

  BitAppButtonIcon.appBar({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32.w,
      height: 32.h,
      child: GestureDetector(
        onTap: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
