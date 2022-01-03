import 'package:flutter/material.dart';
import 'package:pocket_dictionary/core/apptheme.dart';

class Style {
  static TextStyle uppercaseTextStyle() => const TextStyle(
      color: AppTheme.gray,
      fontSize: 16,
      fontWeight: FontWeight.w700
  );

  static TextStyle boldTextStyle() => const TextStyle(
      color: AppTheme.blackTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w700
  );

}