import 'package:flutter/material.dart';

class AppTheme {

  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    colorScheme: lightColorScheme
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: Colors.black,
    colorScheme: darkColorScheme
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: Color(0xFF640AFF),
    secondary: Color(0xFF03DAC5),
    secondaryVariant: Color(0xFF0AE1C5),
    background: white,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: Colors.red,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: primaryColor,
    primaryVariant: Color(0xFF640AFF),
    secondary: Color(0xFF03DAC5),
    secondaryVariant: Color(0xFF0AE1C5),
    background: Colors.black,
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.black,
    error: Colors.red,
    onError: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.dark,
  );

  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color primaryColor = Color(0xff34D178);
  static const Color blackBackground = Color(0xff1E1D2A);
  static const Color gray = Color(0xff7F8A94);
  static const Color blackTextColor = Color(0xff1E1D2A);

}