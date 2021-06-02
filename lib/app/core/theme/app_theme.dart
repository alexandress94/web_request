import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_text_style.dart';

class AppTheme {
  final ThemeData appThemeData = ThemeData.light().copyWith(
    scaffoldBackgroundColor: appBackgroundColor,
    brightness: Brightness.light,
    primaryColor: appPrimeryColor,
    textTheme: AppTextTheme().appTextThemeLight,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(appPrimeryColor),
      ),
    ),
    iconTheme: IconThemeData(
      color: appPrimeryColor,
    ),
  );
}
