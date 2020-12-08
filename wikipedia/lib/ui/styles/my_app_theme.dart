import 'package:flutter/material.dart';

class MyAppTheme {
  MyAppTheme._();

  static const Color appBackgroundColor = Color(0xFFFCFCFC);
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color dividedCol = Color(0xFFC4C4C4);
  static const Color catSelectedBack = Color(0xFF3E3A3C);
  static const Color black = Color(0xFF000000);
  static const Color boxShadow = Color.fromRGBO(0, 0, 0, 0.1);
  

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: appBackgroundColor,
    splashColor: black,
    brightness: Brightness.light,

  );


}
