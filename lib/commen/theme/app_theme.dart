import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get builtLightTheme => ThemeData.light();

  static ThemeData light(BuildContext context) {
    return builtLightTheme.copyWith();
  }
}
