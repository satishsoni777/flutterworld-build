import 'package:flutter/material.dart';

class Themes {

  static ThemeData appThemeLight() {
    return ThemeData(
      brightness: Brightness.dark,
      backgroundColor: Colors.black,
      appBarTheme: AppBarTheme(
        color: Colors.black
      )
    );
  }
}