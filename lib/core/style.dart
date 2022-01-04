import 'package:flutter/cupertino.dart';
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

  static TextStyle primaryTitleStyle() =>  const TextStyle(
      color: AppTheme.primaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w700
  );

  static TextStyle primaryTextStyle(BuildContext context) =>  TextStyle(
      color: context.isDarkMode? AppTheme.white : AppTheme.blackTextColor,
      fontSize: 16,
      fontWeight: FontWeight.w600
  );

  static TextStyle secondaryTextStyle(BuildContext context) =>  TextStyle(
      color: context.isDarkMode? AppTheme.white : AppTheme.blackTextColor,
      fontSize: 14,
      fontWeight: FontWeight.w400
  );

  static InputDecoration roundedTextFieldStyle(
      String label,
      String hint,
      IconData icon) =>
      InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          labelText: label,
          filled: true,
          fillColor: AppTheme.borderColor,
          prefixIcon:  Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(icon),
              onPressed: null,
            ),
          ),
          hintText: hint,
          errorMaxLines: 3,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppTheme.borderColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppTheme.borderColor,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
            ),
          )
      );

}