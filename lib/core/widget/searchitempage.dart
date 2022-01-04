import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pocket_dictionary/core/apptheme.dart';
import 'package:pocket_dictionary/core/style.dart';

class SearchItemPage extends StatelessWidget {
  const SearchItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
            "Ambition",
          style: Style.primaryTextStyle(context),
        ),
        const SizedBox(height: 8),
        Text(
          "a strong desire to do or achieve something.",
          style: Style.secondaryTextStyle(context),
        ),
        const SizedBox(height: 10),
        Divider(
          thickness: 1,
          color: context.isDarkMode? AppTheme.dividerColor: AppTheme.tagColor,
        )
      ],
    );
  }
}
