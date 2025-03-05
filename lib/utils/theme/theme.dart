import 'package:flutter/material.dart';

class VAppTheme {
  VAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Urbanist',
    disabledColor: Colors.grey,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
  );
}
