// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppText extends StatelessWidget {
  final String? value;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const AppText.b40({
    Key? key,
    required this.value,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b32({
    Key? key,
    required this.value,
    this.fontSize = 32,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b24({
    Key? key,
    required this.value,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b20({
    Key? key,
    required this.value,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b18({
    Key? key,
    required this.value,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b16({
    Key? key,
    required this.value,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.t16({
    Key? key,
    required this.value,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b14({
    Key? key,
    required this.value,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.t14({
    Key? key,
    required this.value,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.t12({
    Key? key,
    required this.value,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.b12({
    Key? key,
    required this.value,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w600,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.t10({
    Key? key,
    required this.value,
    this.fontSize = 10,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  const AppText.t8({
    Key? key,
    required this.value,
    this.fontSize = 8,
    this.fontWeight = FontWeight.w400,
    required this.color,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return Text(
        value!.tr(),
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize.sp,
          fontWeight: fontWeight,
          color: color,
        ),
      );
    } else {
      return const Text('data');
    }
  }
}
