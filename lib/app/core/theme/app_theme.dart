import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_text_style.dart';

class AppTheme {
  final ThemeData appThemeData = ThemeData.light().copyWith(
    // Cor do background
    scaffoldBackgroundColor: appBackgroundColor,
    brightness: Brightness.light,
    primaryColor: appPrimeryColor,
    // Theme padrão
    textTheme: AppTextTheme.appTextThemeLight,
    // Personaizando AppBar
    appBarTheme: AppBarTheme(
      centerTitle: true,
      textTheme: AppTextTheme.appTextThemeLight,
    ),
    // Cor do botão ElevatedButton
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

double appDefaultPadding = 16;
