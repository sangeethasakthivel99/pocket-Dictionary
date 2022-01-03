import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pocket_dictionary/core/apptheme.dart';

class Style {
  static TextStyle uppercaseTextStyle() => const TextStyle(
      color: AppTheme.gray,
      fontSize: 16,
      fontWeight: FontWeight.w700
  );

  static TextStyle boldTextStyle(BuildContext context) =>  TextStyle(
      color: context.isDarkMode? AppTheme.white : AppTheme.blackTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w700
  );

}