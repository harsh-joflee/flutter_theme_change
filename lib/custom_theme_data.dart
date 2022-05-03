import 'package:flutter/material.dart';

abstract class CustomThemeData {
  static late Color textColor;
  static late Color scaffoldColor;
  static late Color appbarColor;

  static void setColors(ThemeMode mode) {
    textColor = mode == ThemeMode.dark ? Colors.white : Colors.black;
    scaffoldColor = mode == ThemeMode.dark ? Colors.black : Colors.white;
    appbarColor = mode == ThemeMode.dark ? Colors.black : Colors.white;
  }
}
