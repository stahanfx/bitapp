import 'package:bitapp/theme/styles/color_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  //Принимаем функции
  var onEditingCompleteFunction;
  var onSubmittedFunction;
  var onTapFunction;
  var controllerValue;
  var onSaved;
  var onChanged;

  //Принимаем настроики
  var errorText;
  bool enabled;

  //Принимаем дизайн
  String hintString;
  var prefixIcon;
  var suffixIcon;
  String prefixString = '';
  TextInputAction textInputAction;
  var lines;

  AppTextField({
    Key? key,
    this.onSaved,
    this.controllerValue,
    this.onSubmittedFunction,
    this.onEditingCompleteFunction,
    this.onTapFunction,
    this.onChanged,
    this.errorText,
    this.enabled = true,
    this.hintString = '',
    this.prefixIcon,
    this.suffixIcon,
    this.prefixString = '',
    this.textInputAction = TextInputAction.none,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //Настройки

      //контроллер
      controller: controllerValue,
      onSaved: (value) {
        controllerValue.text = value!;
      },
      onChanged: onChanged,
      //Когда завершаем редактирование
      onEditingComplete: onEditingCompleteFunction,
      //Когда мы жмем кнопку на клаве
      //Когда нажимаем
      onTap: onTapFunction,

      enabled: enabled,
      //Оформление
      style: TextStyle(
        height: 1.4.h,
      ),

      minLines: lines,
      maxLines: lines,

      decoration: InputDecoration(
        // errorText: errorText,

        prefix: Text(prefixString),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintString,
        fillColor: AppColor.white,
        filled: true,
        enabled: enabled,

        //Включен
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.white),
            gapPadding: 10.h),
        prefixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 60.h),
        suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 60.h),

        //В фокусе

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(color: Colors.white),
            gapPadding: 10.h),

        //Отключен

        //Ошибка
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.red.shade100, width: 2.w),
            gapPadding: 100.h),

        //Ошибка в фокусе
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.red, width: 2.w),
            gapPadding: 100.h),
      ),
    );
  }
}
