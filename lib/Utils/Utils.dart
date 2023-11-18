import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utils {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future saveStringWithKey(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future saveIntWithKey(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }

  static Future getStringValueWithKey(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key) ?? '';
  }

  static Future getIntValueWithKey(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  static void showSnackBar(
      {required String title,
      required String message,
      Color? colorText = Colors.white,
      Widget? icon,
      bool isDismissible = true,
      Duration duration = const Duration(seconds: 2),
      Duration animationDuration = const Duration(seconds: 1),
      Color? backgroundColor = Colors.black,
      SnackPosition? direction = SnackPosition.TOP,
      Curve? animation}) {
    Get.snackbar(
      title,
      message,
      colorText: colorText,
      duration: duration,
      animationDuration: animationDuration,
      icon: icon,
      backgroundColor: backgroundColor!.withOpacity(0.3),
      snackPosition: direction,
      forwardAnimationCurve: animation,
    );
  }

  static void showDialog(
      {required String title,
      TextStyle? titleStyle,
      Widget? content,
      String? textCancel,
      String? textConfirm,
      Color? backgroundColor,
      Color? cancelTextColor,
      Color? confirmTextColor,
      Color? buttonColor,
      Widget? customCancel,
      Widget? customConfirm,
      VoidCallback? onCancel,
      VoidCallback? onConfirm,
      double radius = 10.0}) {
    Get.defaultDialog(
        title: title,
        titleStyle: titleStyle,
        content: content,
        textCancel: textCancel,
        textConfirm: textConfirm,
        backgroundColor: backgroundColor,
        cancel: customCancel,
        confirm: customConfirm,
        onCancel: onCancel,
        onConfirm: onConfirm,
        cancelTextColor: cancelTextColor,
        confirmTextColor: confirmTextColor,
        buttonColor: buttonColor,
        radius: radius);
  }

  static Widget textField(
      {required Widget icon,
      TextEditingController? controller,
      String? hintText,
      TextInputType? textInputType,
      List<TextInputFormatter>? inputFormatters,
      int? maxLines,
      ValueChanged? onChanged}) {
    return Column(
      children: [
        Row(children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              maxLines: maxLines,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              decoration:
                  InputDecoration(border: InputBorder.none, hintText: hintText),
            ),
          ),
        ]),
        Container(
          height: 1,
          color: Color.fromRGBO(221, 225, 231, 1),
        )
      ],
    );
  }

  static Widget textFieldMuti(
      {required Widget icon,
      TextEditingController? controller,
      String? hintText,
      TextInputType? textInputType,
      List<TextInputFormatter>? inputFormatters,
      int? maxLines}) {
    return Column(
      children: [
        Row(children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Flexible(
            child: TextField(
              controller: controller,
              maxLines: 5,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: hintText),
            ),
          ),
        ]),
      ],
    );
  }
}
