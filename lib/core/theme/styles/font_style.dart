// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BitAppFonts extends StatelessWidget {
  final String value;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const BitAppFonts.title_1({
    Key? key,
    required this.value,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.title_2({
    Key? key,
    required this.value,
    this.fontSize = 32,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.title_3({
    Key? key,
    required this.value,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.head_1({
    Key? key,
    required this.value,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.head_2({
    Key? key,
    required this.value,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.body_1_1({
    Key? key,
    required this.value,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.body_1_2({
    Key? key,
    required this.value,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.body_2_1({
    Key? key,
    required this.value,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.body_2_2({
    Key? key,
    required this.value,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.capt_1_1({
    Key? key,
    required this.value,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const BitAppFonts.capt_1_2({
    Key? key,
    required this.value,
    this.fontSize = 8,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value.tr(),
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
